import Flutter
import SwiftUI
import Combine
import UIKit
import BlinkIDUX
import BlinkID

public class BlinkidFlutterPlugin: NSObject, FlutterPlugin {
    
    private var result: FlutterResult?
    private var sdkInstance: BlinkIDSdk?
    private var cancellables = Set<AnyCancellable>()
    private var rootVc: UIViewController?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "blinkid_flutter", binaryMessenger: registrar.messenger())
        let instance = BlinkidFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result
        switch call.method {
        case BlinkIdStrings.methodChannelCamera:
            Task {
                await performScan(call)
            }
        case BlinkIdStrings.methodChannelDirectApi:
            print(BlinkIdStrings.methodChannelDirectApi)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func initializeSdk(_ call: FlutterMethodCall) async {
        guard let rawArgs = call.arguments as? [String: Any],
              let args = BlinkidDeserializationUtils.sanitizeDictionary(rawArgs) else {
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: BlinkIdStrings.ErrorMessage.settingsError,
                details: nil
            ))
            return
        }
        
        do {
            guard let sdkSettingsRaw = args["blinkidSdkSettings"] as? [String: Any],
                  let sdkSettingsDict = BlinkidDeserializationUtils.sanitizeDictionary(sdkSettingsRaw),
                  let settings = BlinkidDeserializationUtils.deserializeBlinkIdSdkSettings(sdkSettingsDict) else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: BlinkIdStrings.ErrorMessage.settingsError,
                    details: nil
                ))
                return
            }
            
            sdkInstance = try await BlinkIDSdk.createBlinkIDSdk(withSettings: settings)
            
        } catch {
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: BlinkIdStrings.ErrorMessage.initError + error.localizedDescription,
                details: nil
            ))
        }
    }
    
    
    private func setupBlinkIdSdk(_ call: FlutterMethodCall) async  {
        guard let arguments = call.arguments as? [String: Any] else { return }
        
        do {
            guard let sdkInstance = self.sdkInstance else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: BlinkIdStrings.ErrorMessage.initError,
                    details: nil
                ))
                return
            }
            
            guard let sessionSettingsRaw = arguments["blinkidSessionSettings"] as? [String: Any],
                  let sessionSettings = BlinkidDeserializationUtils.sanitizeDictionary(sessionSettingsRaw) else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: BlinkIdStrings.ErrorMessage.initError,
                    details: nil
                ))
                return
            }
            
            let analyzer = try await BlinkIDAnalyzer(
                sdk: sdkInstance,
                blinkIdSessionSettings: BlinkidDeserializationUtils.deserializeBlinkIdSessionSettings(sessionSettings),
                eventStream: BlinkIDEventStream(),
                classFilter: self
            )
            
            let scanningUxModel = await BlinkIDUXModel(analyzer: analyzer, shouldShowIntroductionAlert: true)
            
            await scanningUxModel.$result
                .sink { [weak self] scanningResultState in
                    guard let self = self else { return }
                    if let scanningResultState,
                       scanningResultState.scanningResult == nil {
                        self.rootVc?.dismiss(animated: true)
                    }
                }
                .store(in: &cancellables)
            
            DispatchQueue.main.async {
                self.presentScanningUI(scanningUxModel)
            }
            
        } catch {
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: BlinkIdStrings.ErrorMessage.initError + error.localizedDescription,
                details: nil
            ))
        }
    }
    
    private func presentScanningUI(_ model: BlinkIDUXModel) {
        guard let rootVC = UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController else {
            return
        }
        
        self.rootVc = rootVC
        
        let viewController = UIHostingController(rootView: BlinkIDUXView(viewModel: model))
        viewController.modalPresentationStyle = .fullScreen
        rootVC.present(viewController, animated: true)
    }
    
    
    func performScan(_ call: FlutterMethodCall) async {
        Task {
            await initializeSdk(call)
            await setupBlinkIdSdk(call)
        }
    }
}

struct BlinkIdStrings {
    static let methodChannelCamera = "performScan"
    static let methodChannelDirectApi = "directApi"
    static let iosError = "blinkid_ios_error"
    
    struct ErrorMessage {
        static let settingsError = "Invalid SDK settings provided"
        static let initError = "Could not initialize the SDK.\nReason: "
        
    }
}

extension BlinkidFlutterPlugin: BlinkIDClassFilter {
    public func classAllowed(classInfo: BlinkID.BlinkIDSDK.DocumentClassInfo) -> Bool {
        return classInfo.country == .usa
    }
}

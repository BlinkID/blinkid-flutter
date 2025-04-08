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
        if let arguments = call.arguments as? Dictionary<String, Any> {
            do {
                if let settings = BlinkidDeserializationUtils.deserializeBlinkIdSdkSettings(arguments["blinkidSdkSettings"] as? Dictionary<String, Any>) {
                    sdkInstance = try await BlinkIDSdk.createBlinkIDSdk(withSettings: settings)
                }
            } catch {
                result?(FlutterError(code: BlinkIdStrings.iosError, message: BlinkIdStrings.ErrorMessage.initError + error.localizedDescription, details: nil))
            }
        } else {
            result?(FlutterError(code: BlinkIdStrings.iosError, message: BlinkIdStrings.ErrorMessage.settingsError, details: nil))
        }
    }
    
    private func setupBlinkIdSdk(_ call: FlutterMethodCall) async {
        do {
            guard let sdkInstance = self.sdkInstance else {
                return self.result!(FlutterError(code: BlinkIdStrings.iosError, message: BlinkIdStrings.ErrorMessage.initError, details: nil))
            }
            
            let analyzer = try await BlinkIDAnalyzer(sdk: sdkInstance, blinkIdSessionSettings: BlinkIDSessionSettings(scanningSettings: ScanningSettings(croppedImageSettings: CroppedImageSettings(returnDocumentImage: true, returnFaceImage: true))), eventStream: BlinkIDEventStream())
            
            let scanningUxModel = await BlinkIDUXModel(analyzer: analyzer, shouldShowIntroductionAlert: true)
            
            DispatchQueue.main.async {
                let rootVc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
                let blinkIdHostingView = UIHostingController(rootView: BlinkIDUXView(viewModel: scanningUxModel))
                blinkIdHostingView.modalPresentationStyle = .fullScreen
                rootVc?.present(blinkIdHostingView, animated: true)
            }
        } catch {
            result?(FlutterError(code: BlinkIdStrings.iosError, message: BlinkIdStrings.ErrorMessage.initError + error.localizedDescription, details: nil))
        }
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

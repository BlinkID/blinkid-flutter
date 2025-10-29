import Flutter
import SwiftUI
import Combine
import UIKit
import BlinkIDUX
import BlinkID

public class BlinkidFlutterPlugin: NSObject, FlutterPlugin {
    
    private var result: FlutterResult?
    private var cancellables = Set<AnyCancellable>()
    private var rootVc: UIViewController?
    private var classInfoFilterDict: Dictionary<String, Any>?
    
    private var blinkIdSdk: BlinkIDSdk?
    private var isSdkLoaded: Bool = false
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "blinkid_flutter", binaryMessenger: registrar.messenger())
        let instance = BlinkidFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result
        switch call.method {
        case BlinkIdStrings.methodChannelCamera:
            Task { await performScan(call) }
        case BlinkIdStrings.methodChannelDirectApi:
            Task { await performDirectApiScan(call) }
        case BlinkIdStrings.methodChannelLoadSdk:
            Task { await loadSdk(call) }
        case BlinkIdStrings.methodChannelunloadSdk:
            Task { await unloadSdk(call) }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func loadSdk(_ call: FlutterMethodCall) async {
        do {
            guard let settings = await setupBlinkIdSettings(call) else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: BlinkIdStrings.ErrorMessage.settingsError,
                    details: nil
                ))
                return
            }
            
            blinkIdSdk = try await BlinkIDSdk.createBlinkIDSdk(withSettings: settings)
            isSdkLoaded = true
            result?("")
        } catch {
            isSdkLoaded = false
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: "\(BlinkIdStrings.ErrorMessage.settingsError) Reason: \(error.localizedDescription)",
                details: nil
            ))
        }

    }
    
    private func unloadSdk(_ call: FlutterMethodCall) async {
        guard let arguments = call.arguments as? [String: Any] else { return }
        if let deleteResources = arguments["deleteCachedResources"] as? Bool {
            if deleteResources {
               await BlinkIDSdk.terminateBlinkIDSdk()
            } else {
                await BlinkIDSdk.terminateBlinkIDSdkAndDeleteCachedResources()
            }
            blinkIdSdk = nil
            isSdkLoaded = false
            result?("")
        }
    }
    
    private func setupBlinkIdSettings(_ call: FlutterMethodCall) async -> BlinkIDSdkSettings? {
        guard let rawArgs = call.arguments as? [String: Any],
              let arguments = BlinkIdDeserializationUtils.sanitizeDictionary(rawArgs) else {
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: BlinkIdStrings.ErrorMessage.settingsError,
                details: nil
            ))
            return nil
        }
        
        
        guard let sdkSettingsRaw = arguments["blinkidSdkSettings"] as? [String: Any],
              let sdkSettingsDict = BlinkIdDeserializationUtils.sanitizeDictionary(sdkSettingsRaw),
              let settings = BlinkIdDeserializationUtils.deserializeBlinkIdSdkSettings(sdkSettingsDict) else {
            result?(FlutterError(
                code: BlinkIdStrings.iosError,
                message: BlinkIdStrings.ErrorMessage.settingsError,
                details: nil
            ))
            return nil
        }
        return settings
    }
    
    
    private func performScan(_ call: FlutterMethodCall) async  {
        guard let arguments = call.arguments as? [String: Any] else { return }
        do {
            
            if !isSdkLoaded { try await loadSdk(call) }
            
            guard let blinkIdSdk = blinkIdSdk else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: "\(BlinkIdStrings.ErrorMessage.initError) Reason: The BlinkID SDK is not initialized. Call the loadBlinkIdSdk() method to pre-load the SDK first, or try running the performScan() method with a valid internet connection.",
                    details: nil))
                return
            }
            
            guard let sessionSettingsRaw = arguments["blinkidSessionSettings"] as? [String: Any],
                  let sessionSettings = BlinkIdDeserializationUtils.sanitizeDictionary(sessionSettingsRaw) else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: BlinkIdStrings.ErrorMessage.initError,
                    details: nil
                ))
                return
            }
            
            classInfoFilterDict = arguments["blinkidClassFilter"] as? [String: Any]
            
            let analyzer = try await BlinkIDAnalyzer(
                sdk: blinkIdSdk,
                blinkIdSessionSettings: BlinkIdDeserializationUtils.deserializeBlinkIdSessionSettings(sessionSettings),
                eventStream: BlinkIDEventStream(),
                classFilter: self
            )
            
            await addFlutterPinglet(with: analyzer.sessionNumber)
            
            var shouldShowIntroductionAlert = true, shouldShowHelpButton = true
            if let blinkidUiSettings = arguments["blinkidUiSettings"] as? [String: Any] {
                if let showOnboardingDialog = blinkidUiSettings["showOnboardingDialog"] as? Bool {
                    shouldShowIntroductionAlert = showOnboardingDialog
                }
                
                if let showHelpButton = blinkidUiSettings["showHelpButton"] as? Bool {
                    shouldShowHelpButton = showHelpButton
                }
            }
            
            let scanningUxModel = await BlinkIDUXModel(
                analyzer: analyzer,
                shouldShowIntroductionAlert: shouldShowIntroductionAlert,
                showHelpButton: shouldShowHelpButton,
                sessionNumber: analyzer.sessionNumber
            )

            let scannedResults =  await scanningUxModel.$result
                .sink { [weak self] scanningResultState in
                    if let scanningResultState {
                        if let scanningResult = scanningResultState.scanningResult {
                            DispatchQueue.main.async {
                                self?.result?(BlinkIdSerializationUtils.serializeBlinkIdScanningResult(scanningResult))
                                self?.rootVc?.dismiss(animated: true)
                            }
                        }
                        else {
                            Task {
                                await BlinkIDSdk.terminateBlinkIDSdk()
                            }
                            
                            DispatchQueue.main.async {
                                self?.result?(FlutterError(code: BlinkIdStrings.iosError, message: "Scanning has been canceled", details: nil))
                                self?.rootVc?.dismiss(animated: true)
                            }
                        }
                    }
                }
                .store(in: &cancellables)
            
            DispatchQueue.main.async {
                self.presentScanningUI(scanningUxModel)
            }
            
        } catch {
            if let error = error as? InvalidLicenseKeyError {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: "\(BlinkIdStrings.ErrorMessage.initError) Reason: \(error.message)",
                    details: nil
                ))
            } else {
                result?(FlutterError(
                    code: BlinkIdStrings.iosError,
                    message: "\(BlinkIdStrings.ErrorMessage.initError) Reason: \(error.localizedDescription)",
                    details: nil))
            }
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
    
    func performDirectApiScan(_ call: FlutterMethodCall) async {
        if let arguments = call.arguments as? Dictionary<String, Any> {
            
            do {
                
                if !isSdkLoaded { try await loadSdk(call) }
                
                guard let blinkIdSdk = blinkIdSdk else {
                    result?(FlutterError(
                        code: BlinkIdStrings.iosError,
                        message: "\(BlinkIdStrings.ErrorMessage.initError) Reason: The BlinkID SDK is not initialized. Call the loadBlinkIdSdk() method to pre-load the SDK first, or try running the performDirectApiScan() method with a valid internet connection.",
                        details: nil))
                    return
                }
                
                if  let sessionSettingsRaw = arguments["blinkidSessionSettings"] as? [String: Any],
                    let sessionSettingsClean = BlinkIdDeserializationUtils.sanitizeDictionary(sessionSettingsRaw) {
                    
                    var sessionSettings = BlinkIdDeserializationUtils.deserializeBlinkIdSessionSettings(sessionSettingsClean)
                    sessionSettings.inputImageSource = .photo
                    
                    let session = try await blinkIdSdk.createScanningSession(sessionSettings: sessionSettings)
                    
                    await addFlutterPinglet(with: session.getSessionNumber())
                    
                    guard let frontUIImage = BlinkIdDeserializationUtils.deserializeBase64Image(arguments["firstImage"] as? String) else {
                        result?(FlutterError(
                            code: BlinkIdStrings.iosError,
                            message: BlinkIdStrings.ErrorMessage.initError,
                            details: nil
                        ))
                        return
                    }
                    
                    await session.process(inputImage: InputImage(uiImage: frontUIImage))
                    
                    if let backUIImage = BlinkIdDeserializationUtils.deserializeBase64Image(arguments["secondImage"] as? String) {
                        await session.process(inputImage: InputImage(uiImage: backUIImage))
                    }
                    
                    let scannedResults = await session.getResult()
                    DispatchQueue.main.async {
                        self.result?(BlinkIdSerializationUtils.serializeBlinkIdScanningResult(scannedResults))
                        
                    }
                } else {
                    result?(FlutterError(
                        code: BlinkIdStrings.iosError,
                        message: BlinkIdStrings.ErrorMessage.initError,
                        details: nil
                    ))
                    
                    return
                }
            } catch {
                if let error = error as? InvalidLicenseKeyError {
                    result?(FlutterError(code: BlinkIdStrings.iosError, message: error.message, details: nil))
                } else {
                    result?(FlutterError(code: BlinkIdStrings.iosError, message: error.localizedDescription, details: nil))
                }

            }
        }
    }
    
    private func addFlutterPinglet(with sessionNumber: Int) async {
        await PingManager.shared.addPinglet(
            pinglet: WrapperProductInfoPinglet(wrapperProduct: .crossplatformflutter),
            sessionNumber: sessionNumber)
    }
}

struct BlinkIdStrings {
    static let methodChannelCamera = "performScan"
    static let methodChannelDirectApi = "performDirectApiScan"
    static let methodChannelLoadSdk = "loadBlinkIdSdk"
    static let methodChannelunloadSdk = "unloadBlinkIdSdk"
    static let iosError = "blinkid_ios_error"
    
    struct ErrorMessage {
        static let settingsError = "Invalid SDK settings provided"
        static let initError = "Could not initialize the SDK."
        static let frontImageError = "Could not extract the information from the first image! An image of a valid document needs to be sent."
        
    }
}

extension BlinkidFlutterPlugin: BlinkIDClassFilter {
    public func classAllowed(classInfo: BlinkID.BlinkIDSDK.DocumentClassInfo) -> Bool {
        if let classInfoFilterDict = classInfoFilterDict {
            return BlinkIdDeserializationUtils.deserializeClassFilter(classInfoFilterDict, classInfo)
        }
        return true
    }
}

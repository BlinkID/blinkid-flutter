import Flutter
import UIKit

public class MicroblinkScannerViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    @objc public init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return MicroblinkScannerView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class MicroblinkScannerView: NSObject,
                             FlutterPlatformView {
    
    private let controller = UIViewController()
    private let channel: FlutterMethodChannel
    private var recognizerCollection: MBRecognizerCollection?
    private var overlayViewController: CustomOverlayViewController?
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger
    ) {
        controller.view = UIView()
        self.channel = FlutterMethodChannel(name: "MicroblinkScannerWidget/" + String(viewId), binaryMessenger: messenger)
        let arguments = args as! [AnyHashable : Any]
        MBMicroblinkSDK.shared().setLicenseKey(arguments["licenseKey"] as! String, errorCallback: { _ in })
        
        let recognizerCollectionDict = arguments["recognizerCollection"] as! [AnyHashable : Any]
        self.recognizerCollection = MBRecognizerSerializers.sharedInstance().deserializeRecognizerCollection(recognizerCollectionDict)!
        
        super.init()
        
        
        self.channel.setMethodCallHandler(methodHandler)
        let settingsDict = arguments["overlaySettings"] as! [AnyHashable : Any]
        self.prepare(frame: frame, jsonSettings: settingsDict)
    }
    
    func view() -> UIView {
        return controller.view
    }
    
    func prepare(frame: CGRect, jsonSettings: [AnyHashable : Any]) {
        let settings = MBOverlaySettings()
        
        MBOverlaySerializationUtils.extractCommonOverlaySettings(jsonSettings, overlaySettings: settings)
        
        settings.cameraSettings.cameraPreset = MBCameraPreset.presetPhoto
        
        let overlayViewController = CustomOverlayViewController.init(recognizerCollection: self.recognizerCollection!,
                                                                     cameraSettings: settings.cameraSettings)
        overlayViewController.delegate = self
        
        let recognizerController = MBViewControllerFactory.recognizerRunnerViewController(withOverlayViewController: overlayViewController)!
        
        self.overlayViewController = overlayViewController
        
        recognizerController.view.frame = frame
        controller.view.addSubview(recognizerController.view)
        controller.addChild(recognizerController)
        recognizerController.didMove(toParent: controller)
    }
    
    private func methodHandler(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        switch(call.method){
        case "resumeScanning":
            self.overlayViewController?.resumeScanning()
            result(nil)
        default:
            result(FlutterError(code: "Unsupported", message: "\(call.method) is not supported.", details: call))
        }
        
    }
    
}

extension MicroblinkScannerView: CustomOverlayViewControllerDelegate {
    func onClose() {
        self.channel.invokeMethod("onClose", arguments: nil)
    }
    
    func onError(error: Error) {
        self.channel.invokeMethod("onError", arguments: error.localizedDescription)
    }
    
    func onFinishScanning(results: [[AnyHashable : Any]?]) {
        let data = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted)
        let arguments = data == nil ? nil : String(data: data!, encoding: .utf8)
        self.channel.invokeMethod("onFinishScanning", arguments: arguments)
    }
    
    func onFirstSideScanned() {
        self.channel.invokeMethod("onFirstSideScanned", arguments: nil)
    }
    
    func onDetectionStatusUpdated(_ status: MBDetectionStatus) {
        let encodedStatus: String = {switch status {
        case .cameraAtAngle:
            return "CAMERA_AT_ANGLE"
        case .fail:
            return "FAIL"
        case .success:
            return "SUCCESS"
        case .cameraTooHigh:
            return "CAMERA_TOO_HIGH"
        case .fallbackSuccess:
            return "FALLBACK_SUCCESS"
        case .partialForm:
            return "PARTIAL_OBJECT"
        case .cameraTooNear:
            return "CAMERA_TOO_NEAR"
        case .documentTooCloseToEdge:
            return "DOCUMENT_TOO_CLOSE_TO_EDGE"
        default:
            return ""
        }}()
        if encodedStatus.isEmpty {
            return
        }
        
        self.channel.invokeMethod("onDetectionStatusUpdate", arguments: "{\"detectionStatus\": \"\(encodedStatus)\"}")
    }

    func onScanDone(_ state: MBRecognizerResultState) {
        DispatchQueue.main.async {
            self.channel.invokeMethod("onScanDone", arguments: state.name)
        }
    }
}

protocol CustomOverlayViewControllerDelegate {
    func onFinishScanning(results: [[AnyHashable : Any]?])
    func onFirstSideScanned()
    func onDetectionStatusUpdated(_ status: MBDetectionStatus)
    func onScanDone(_ state: MBRecognizerResultState)
    func onClose()
    func onError(error: Error)
}

class CustomOverlayViewController : MBCustomOverlayViewController,
                                    MBScanningRecognizerRunnerViewControllerDelegate,
                                    MBFirstSideFinishedRecognizerRunnerViewControllerDelegate,
                                    MBDetectionRecognizerRunnerViewControllerDelegate, MBRecognizerRunnerViewControllerDelegate {
    var delegate: CustomOverlayViewControllerDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(recognizerCollection: MBRecognizerCollection, cameraSettings: MBCameraSettings) {
        super.init(recognizerCollection: recognizerCollection, cameraSettings: cameraSettings)
        self.scanningRecognizerRunnerViewControllerDelegate = self
        self.recognizerRunnerViewControllerDelegate = self
        self.metadataDelegates.detectionRecognizerRunnerViewControllerDelegate = self
        self.metadataDelegates.firstSideFinishedRecognizerRunnerViewControllerDelegate = self
    }
    
    func recognizerRunnerViewControllerUnauthorizedCamera(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {}
    
    func recognizerRunnerViewController(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController,
                                        didFindError error: Error) {
        DispatchQueue.main.async {
            self.delegate?.onError(error: error)
        }
    }
    
    func recognizerRunnerViewControllerDidClose(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {
        DispatchQueue.main.async {
            self.delegate?.onClose()
        }
    }
    
    func recognizerRunnerViewControllerWillPresentHelp(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {}
    
    func recognizerRunnerViewControllerDidResumeScanning(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {}
    
    func recognizerRunnerViewControllerDidStopScanning(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {}
    
    func recognizerRunnerViewControllerDidFinishRecognition(ofFirstSide recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {
        DispatchQueue.main.async {
            self.delegate?.onFirstSideScanned()
        }
    }

    func recognizerRunnerViewController(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController,
                                        didFinishDetectionWithDisplayableQuad displayableQuad: MBDisplayableQuadDetection) {
        DispatchQueue.main.async {
            self.delegate?.onDetectionStatusUpdated(displayableQuad.detectionStatus)
        }
    }
    
    func recognizerRunnerViewControllerDidFinishScanning(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController,
                                                         state: MBRecognizerResultState) {
        self.delegate?.onScanDone(state)
        
        if state == .valid {
            recognizerRunnerViewController.pauseScanning()
            DispatchQueue.main.async(execute: {() -> Void in
                let results = self.recognizerCollection.recognizerList.map({ return $0.serializeResult() })
                self.delegate?.onFinishScanning(results: results)
            })
        }
    }
    
    func resumeScanning() { recognizerRunnerViewController?.resumeScanningAndResetState(true)}
    
    
}


extension MBRecognizerResultState {
    var name: String {
        switch(self){
        case .empty:
            return "empty"
        case .stageValid:
            return "stageValid"
        case .uncertain:
            return "uncertain"
        case .valid:
            return "valid"
        @unknown default:
            fatalError("\(self) is not supported.")
        }
    }
}

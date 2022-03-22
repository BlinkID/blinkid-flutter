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
                             FlutterPlatformView,
                             MBOverlayViewControllerDelegate {
    func overlayViewControllerDidFinishScanning(_ overlayViewController: MBOverlayViewController!, state: MBRecognizerResultState) {
        if state == .valid {
            // first, pause scanning until we process all the results
            overlayViewController.recognizerRunnerViewController?.pauseScanning()
            
            DispatchQueue.main.async(execute: {() -> Void in
                let results = self.recognizerCollection!.recognizerList.map({ return $0.serializeResult() })
                self.channel.invokeMethod("onFinishScanning", arguments: results)
            })
        }
    }
    
    func overlayDidTapClose(_ overlayViewController: MBOverlayViewController!) {
        overlayViewController.recognizerRunnerViewController?.pauseScanning()
        DispatchQueue.main.async(execute: {() -> Void in
            self.channel.invokeMethod("onClose", arguments: nil)
        })
    }
    
    private let controller = UIViewController()
    private let channel: FlutterMethodChannel
    private var recognizerCollection: MBRecognizerCollection?
    
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
        
        let settingsDict = arguments["settings"] as! [AnyHashable : Any]
        self.prepare(frame: frame, settings: settingsDict)
    }
    
    func view() -> UIView {
        return controller.view
    }
    
    func prepare(frame: CGRect, settings: [AnyHashable : Any]) {
        let overlayViewController = MBOverlaySettingsSerializers.sharedInstance()!
            .createOverlayViewController(settings, recognizerCollection: self.recognizerCollection, delegate: self)!
        
        let recognizerController = MBViewControllerFactory.recognizerRunnerViewController(withOverlayViewController: overlayViewController)!
        recognizerController.view.frame = frame
        controller.view.addSubview(recognizerController.view)
        controller.addChild(recognizerController)
        recognizerController.didMove(toParent: controller)
    }
    
}

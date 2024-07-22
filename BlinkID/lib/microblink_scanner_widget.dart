import 'dart:convert';

import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MicroblinkScannerWidget extends StatefulWidget {
  const MicroblinkScannerWidget({
    Key? key,
    required this.collection,
    required this.settings,
    required this.licenseKey,
    required this.onScanDone,
    required this.onResult,
    required this.onError,
    required this.onFirstSideScanned,
    required this.onDetectionUpdate,
  }) : super(key: key);

  final RecognizerCollection collection;
  final OverlaySettings settings;
  final String licenseKey;

  /// Called when Microblink has done the recognition of the image frame.
  ///
  /// Mind that this is not the state of some individual recognizer, but the state of the overall image recognition
  /// operation.
  final ValueSetter<RecognizerResultState> onScanDone;

  /// This function is called when Microblink has a result that is not unsuccessful.
  /// During execution of this function no scanning would be done. The returned value controls whether scanning would
  /// be resumed. If it returns true, scanning would be resumed. If false, scanning would not be resumed and client
  /// is expected to dispose of this Widget.
  final MicroblinkScannerResultCallback onResult;
  final ValueChanged<String> onError;
  final VoidCallback onFirstSideScanned;
  final ValueChanged<DetectionUpdate> onDetectionUpdate;

  @override
  State<MicroblinkScannerWidget> createState() => _MicroblinkScannerWidgetState();
}

class _MicroblinkScannerWidgetState extends State<MicroblinkScannerWidget> {
  late MethodChannel channel;

  Future<void> _onFinishScanning(MethodCall call) async {
    final List? jsonResults = jsonDecode(call.arguments);

    if (jsonResults == null) {
      if (await widget.onResult(null)) channel.invokeMethod('resumeScanning');

      return;
    }

    List<RecognizerResult> results = [];

    for (var i = 0; i < jsonResults.length; i++) {
      final map = Map<String, dynamic>.from(jsonResults[i]);
      final data = widget.collection.recognizerArray[i].createResultFromNative(map);
      if (data.resultState != RecognizerResultState.empty) {
        results.add(data);
      }
    }

    if (await widget.onResult(results)) channel.invokeMethod('resumeScanning');
  }

  void _onDetectionStatusUpdate(MethodCall call) {
    final Map<String, dynamic> json = jsonDecode(call.arguments);
    final detectionStatusUpdate = DetectionUpdate.fromJson(json);
    widget.onDetectionUpdate(detectionStatusUpdate);
  }

  void _createChannel(int viewId) {
    channel = MethodChannel('com.microblink.blinkid.flutter/MicroblinkScannerWidget/$viewId')
      ..setMethodCallHandler((call) async {
        if (call.method == 'onScanDone') {
          final name = call.arguments as String;
          widget.onScanDone(RecognizerResultState.values.byName(name));
        } else if (call.method == 'onFinishScanning') {
          _onFinishScanning(call);
        } else if (call.method == 'onClose') {
          widget.onResult(null);
        } else if (call.method == 'onFirstSideScanned') {
          widget.onFirstSideScanned();
        } else if (call.method == 'onError') {
          widget.onError(call.arguments as String);
        } else if (call.method == 'onDetectionStatusUpdate') {
          _onDetectionStatusUpdate(call);
        } else {
          throw PlatformException(
            code: 'Unsupported',
            details: 'Unsupported method ${call.method}',
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = 'MicroblinkScannerView';
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'recognizerCollection': widget.collection.toJson(),
      'licenseKey': widget.licenseKey,
      'overlaySettings': widget.settings.toJson(),
    };

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: _createChannel,
        );
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: _createChannel,
        );
      default:
        throw UnsupportedError('$viewType platform view is not supported on ${defaultTargetPlatform.name}.');
    }
  }
}

typedef MicroblinkScannerResultCallback = Future<bool> Function(
  List<RecognizerResult>?,
);

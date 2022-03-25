import 'dart:convert';

import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef MicroblinkScannerResultCallback = void Function(
  List<RecognizerResult>?,
);

class MicroblinkScannerWidget extends StatefulWidget {
  const MicroblinkScannerWidget({
    Key? key,
    required this.collection,
    required this.settings,
    required this.licenseKey,
    required this.onResult,
  }) : super(key: key);

  final RecognizerCollection collection;
  final String licenseKey;
  final MicroblinkScannerResultCallback onResult;
  final OverlaySettings settings;

  @override
  State<MicroblinkScannerWidget> createState() => _MicroblinkScannerWidgetState();
}

class _MicroblinkScannerWidgetState extends State<MicroblinkScannerWidget> {
  late MethodChannel channel;

  void _onFinishScanning(MethodCall call) {
    final List<Map>? jsonResults = jsonDecode(call.arguments);

    if (jsonResults == null) {
      widget.onResult(null);

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

    widget.onResult(results);
  }

  void _createChannel(int viewId) {
    channel = MethodChannel('MicroblinkScannerWidget/$viewId')
      ..setMethodCallHandler((call) async {
        if (call.method == 'onFinishScanning') {
          _onFinishScanning(call);
        } else if (call.method == 'onClose') {
          widget.onResult(null);
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
      'settings': widget.settings.toJson(),
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

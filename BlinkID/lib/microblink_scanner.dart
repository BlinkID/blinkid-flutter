import 'dart:async';
import 'dart:convert';

import 'package:blinkid_flutter/overlay_settings.dart';
import 'package:blinkid_flutter/recognizer.dart';
import 'package:flutter/services.dart';

export 'package:blinkid_flutter/recognizer.dart';
export 'package:blinkid_flutter/overlay_settings.dart';
export 'package:blinkid_flutter/types.dart';

class MicroblinkScanner {

  static const MethodChannel _channel = const MethodChannel('blinkid_scanner');

  static const String METHOD_SCAN_WITH_CAMERA = 'scanWithCamera';

  static const String ARG_RECOGNIZER_COLLECTION = 'recognizerCollection';
  static const String ARG_OVERLAY_SETTINGS = 'overlaySettings';
  static const String ARG_LICENSE = 'license';
  static const String ARG_LICENSE_KEY = 'licenseKey';
  static const String ARG_LICENSEE = 'licensee';
  static const String ARG_SHOW_LICENSE_WARNING = 'showTrialLicenseWarning';

  static Future<List<RecognizerResult>> scanWithCamera(RecognizerCollection collection, OverlaySettings overlaySettings, String license) async {
    var jsonResults = jsonDecode(await _channel.invokeMethod(
      METHOD_SCAN_WITH_CAMERA,
      {
        ARG_RECOGNIZER_COLLECTION: jsonDecode(jsonEncode(collection)),
        ARG_OVERLAY_SETTINGS: jsonDecode(jsonEncode(overlaySettings)),
        ARG_LICENSE: {
          ARG_LICENSE_KEY: license
        }
      })
    );

    if (jsonResults == null) return List.empty();

    var results = [];
    for (int i = 0; i < jsonResults.length; ++i) {
      var map = Map<String, dynamic>.from(jsonResults[i]);
      var result = collection.recognizerArray[i].createResultFromNative(map);
      if (result.resultState != RecognizerResultState.empty) {
        results.add(result);
      }
    }

    return List<RecognizerResult>.from(results);
  }
}

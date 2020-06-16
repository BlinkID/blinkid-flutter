import 'dart:async';
import 'dart:convert';

import 'package:blinkid_flutter/overlay_settings.dart';
import 'package:blinkid_flutter/recognizer.dart';
import 'package:flutter/services.dart';

export 'package:blinkid_flutter/recognizer.dart';
export 'package:blinkid_flutter/overlay_settings.dart';
export 'package:blinkid_flutter/types.dart';

class BlinkIDFlutter {
  static const MethodChannel _channel =
      const MethodChannel('blinkid_flutter');

  static Future<List<RecognizerResult>> scanWithCamera(RecognizerCollection collection, OverlaySettings overlaySettings, String license) async {
    final List<dynamic> jsonResults = await _channel.invokeMethod(
      'scanWithCamera',
      {
        "recognizerCollection": jsonDecode(jsonEncode(collection)),
        "overlaySettings": jsonDecode(jsonEncode(overlaySettings)),
        "license": {
          "licenseKey": license,
          "licensee": ""
        }
      }
    );

    if (jsonResults == null) return List<RecognizerResult>(0);

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
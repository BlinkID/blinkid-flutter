import 'package:blinkid_flutter/blinkid_flutter.dart';
import 'package:flutter/material.dart';
import "dart:convert";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _resultString = "";
  String _fullDocumentFrontImageBase64 = "";
  String _fullDocumentBackImageBase64 = "";
  String _faceImageBase64 = "";

  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwAAAEgY29tLmV4YW1wbGUuYmxpbmtpZEZsdXR0ZXJTYW1wbGWRQPR97CHKqmlpT8RJ3qYsEb2Bf4hf71Y+Khtp56uVTF7HHSBe6U4Yu5eorGtpSz6Ni4zcc1Va7wwwIM7y+bttFUQN94JGKyRHCF36Jzf2yND4pu8JVvjaX9WIlCm8YyQd10nAhwQNt+c710RuqGxrZl9hgFeJiFXAn1MAa+pksqd1UDSBE4/byWRrVT7XKrZSFwq3axtwx9AlGC0K5kDesuipdOhLCgnsNLTzH8RlDloQNzANz/raSf8ddVkCe+i2rAZPd6OkkAKqBPxqSMg";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "";
    }

    var idRecognizer = BlinkIdCombinedRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    var passportRecognizer = PassportRecognizer();
    passportRecognizer.returnFullDocumentImage = true;
    passportRecognizer.returnFaceImage = true;

    BlinkIdOverlaySettings settings = BlinkIdOverlaySettings();

    var results = await BlinkIDFlutter.scanWithCamera(RecognizerCollection([idRecognizer, passportRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    if (results[0] is BlinkIdCombinedRecognizerResult) {
      BlinkIdCombinedRecognizerResult result = results[0];
      setState(() {
        _resultString = getIdResultString(result);
        _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage;
        _fullDocumentBackImageBase64 = result.fullDocumentBackImage;
        _faceImageBase64 = result.faceImage;
      });
    } else if (results[0] is PassportRecognizerResult) {
      PassportRecognizerResult result = results[0];
      setState(() {
        _resultString = getPassportResultString(result);
        _fullDocumentFrontImageBase64 = result.fullDocumentImage;
        _fullDocumentBackImageBase64 = "";
        _faceImageBase64 = result.faceImage;
      });
    }
  }

  String getIdResultString(BlinkIdCombinedRecognizerResult result) {
    return
      "First name: ${result.firstName}\n"
      "Last name: ${result.lastName}\n"
      "Address: ${result.address}\n"
      "Document number: ${result.documentNumber}\n"
      "Sex: ${result.sex}\n"
      "Date of birth: ${result.dateOfBirth.day}."
        "${result.dateOfBirth.month}."
        "${result.dateOfBirth.year}\n"
      "Date of issue: ${result.dateOfIssue.day}."
        "${result.dateOfIssue.month}."
        "${result.dateOfIssue.year}\n"
      "Date of expiry: ${result.dateOfExpiry.day}."
        "${result.dateOfExpiry.month}."
        "${result.dateOfExpiry.year}\n";
  }

  String getPassportResultString(PassportRecognizerResult result) {
    return
      "First name: ${result.mrzResult.primaryId}\n"
      "Last name: ${result.mrzResult.secondaryId}\n"
      "Document number: ${result.mrzResult.documentNumber}\n"
      "Sex: ${result.mrzResult.gender}\n"
      "Date of birth: ${result.mrzResult.dateOfBirth.day}."
        "${result.mrzResult.dateOfBirth.month}."
        "${result.mrzResult.dateOfBirth.year}\n"
      "Date of expiry: ${result.mrzResult.dateOfExpiry.day}."
        "${result.mrzResult.dateOfExpiry.month}."
        "${result.mrzResult.dateOfExpiry.year}\n";
  }

  @override
  Widget build(BuildContext context) {
    Widget fullDocumentFrontImage = Container();
    if (_fullDocumentFrontImageBase64 != null &&
        _fullDocumentFrontImageBase64 != "") {
      fullDocumentFrontImage = Column(
        children: <Widget>[
          Text("Document Front Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentFrontImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget fullDocumentBackImage = Container();
    if (_fullDocumentBackImageBase64 != null &&
        _fullDocumentBackImageBase64 != "") {
      fullDocumentBackImage = Column(
        children: <Widget>[
          Text("Document Back Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentBackImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget faceImage = Container();
    if (_faceImageBase64 != null && _faceImageBase64 != "") {
      faceImage = Column(
        children: <Widget>[
          Text("Face Image:"),
          Image.memory(
            Base64Decoder().convert(_faceImageBase64),
            height: 150,
            width: 100,
          )
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BlinkID Sample"),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                    child: RaisedButton(
                      child: Text("Scan"),
                      onPressed: () => scan(),
                    ),
                    padding: EdgeInsets.only(bottom: 16.0)),
                Text(_resultString),
                fullDocumentFrontImage,
                fullDocumentBackImage,
                faceImage,
              ],
            )),
      ));
  }
}

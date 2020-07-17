import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";


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
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP+dpSuS/38LVOsaLNXzaiMXsGsDI9HoCvvTwW0ELAiAcBZdB/nLLlJdH4YxsICG1tc+42mh1/syML14kCuZrvHHUiGx1lwGyZGtAa65HTgU85+aXJwt95XSSiuiLjPXw6ue37/oqp3oHtw0P2xXzUA+jX6czpIynFScNPEInu81f1ylj15sbHxhmy/hPEvHEBd26myGxhjpM/JHX8jmrvmT02/ouLUWSbixVELFClQMBZ96X8omCq8l6SzuZJdRTcSxmpuj+";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdf5ZkGlTu9W3v1xEYnFautC44tpbaAeaHkSdH0wrd8IYzBmTJ9fhe4iEYQBvhxBQsmyK5SY84qumgrVhCz69l+GtbFktpndyzqjvsjKRY50o9vpQ6KesA50OQMJtwPqbadjQz6tDa5sELkGHXeoL6YrTiUIHz6O6xgo0PFMCuYeJjS9bTiIy8sKLyhwyquMjkc9wausrC8SdGN7ao7Wv9Q1SPMGo9w+Olc3Mvz0Xlys/a5O7zJI63DV0YMQqiOlzx4IWLfUe";
    }

    var idRecognizer = BlinkIdCombinedRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    BlinkIdOverlaySettings settings = BlinkIdOverlaySettings();

    var results = await MicroblinkScanner.scanWithCamera(RecognizerCollection([idRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkIdCombinedRecognizerResult) {
          if (result.mrzResult.documentType == MrtdDocumentType.Passport) {
            _resultString = getPassportResultString(result);
          } else {
            _resultString = getIdResultString(result);
          }

          setState(() {
            _resultString = _resultString;
            _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage;
            _fullDocumentBackImageBase64 = result.fullDocumentBackImage;
            _faceImageBase64 = result.faceImage;
          });

          return;
      }
    }
  }

  String getIdResultString(BlinkIdCombinedRecognizerResult result) {
    var dateOfBirth = "";
    if(result.dateOfBirth != null) {
      dateOfBirth = "Date of birth: ${result.dateOfBirth.day}."
          "${result.dateOfBirth.month}."
          "${result.dateOfBirth.year}\n";
    }

    var dateOfIssue = "";
    if(result.dateOfIssue != null) {
      dateOfIssue = "Date of issue: ${result.dateOfIssue.day}."
          "${result.dateOfIssue.month}."
          "${result.dateOfIssue.year}\n";
    }

    var dateOfExpiry = "";
    if(result.dateOfExpiry != null) {
      dateOfExpiry = "Date of expiry: ${result.dateOfExpiry.day}."
          "${result.dateOfExpiry.month}."
          "${result.dateOfExpiry.year}\n";
    }


    return
      "First name: ${result.firstName}\n"
      "Last name: ${result.lastName}\n"
      "Address: ${result.address}\n"
      "Document number: ${result.documentNumber}\n"
      "Sex: ${result.sex}\n"
      "$dateOfBirth"
      "$dateOfIssue"
      "$dateOfExpiry";
  }

  String getPassportResultString(BlinkIdCombinedRecognizerResult result) {
    var dateOfBirth = "";
    if(result.mrzResult.dateOfBirth != null) {
      dateOfBirth = "Date of birth: ${result.mrzResult.dateOfBirth.day}."
          "${result.mrzResult.dateOfBirth.month}."
          "${result.mrzResult.dateOfBirth.year}\n";
    }

    var dateOfExpiry = "";
    if(result.mrzResult.dateOfExpiry != null) {
      dateOfExpiry = "Date of expiry: ${result.mrzResult.dateOfExpiry.day}."
          "${result.mrzResult.dateOfExpiry.month}."
          "${result.mrzResult.dateOfExpiry.year}\n";
    }

    return
      "First name: ${result.mrzResult.secondaryId}\n"
      "Last name: ${result.mrzResult.primaryId}\n"
      "Document number: ${result.mrzResult.documentNumber}\n"
      "Sex: ${result.mrzResult.gender}\n"
      "$dateOfBirth"
      "$dateOfExpiry";
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

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
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP4FpSuS/38JVPZ6LMS08lcu81gG/oGTKny4tPf7qrukqKTjEn5zpgzJ+z8Qhf/DzQ+rgwne5bcqvcoqY9n4fo3osaFDX1BWka1tEEmpAAJzfiZJ3MtOzdOFqyuHybzz0DWj3kemWYgJeWFbRIYQGWV56Kig9qio3d1akBWMa1wOs2mUL5Oj2w6IHS1v5E78nnjxynAgVsGKI2TqPsZFjmXfdsxg7uVP3z8ZEDYO+rOhCH3AxCk5DG++7aXGZ8HijRmvDt7z/jQfYcAApgzTTA8dDjOJ5fhMxCOKkxyzr21KjaKhDevT6NZjxp5tmbsM5A8lZ";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdZhZkGlTu9U3PWNHZAAPMfggO8eqRqstS/pzAj03JIRM4oKtZHC3x01wMUK/j4ZjCEdfIGTcuaz8sIaJY3rE/o43J+8GQMgTkoKu3qCjqowrQgNT6JqiD7Vkth1TDhdjv3bJq5BmewGdyJzVnT8yk+wCV8XBqqY4dJozSfZRgmgAp2O/WnXfveCTpHqnHjH50fCLTgertIHJs6ekk8FxHtWKkoiXixZnkLppqxjn1bc4l51VAaXaf+HhlAYSYVgQZJpk+n8CtNfemcGHw4sNq2xYGQ1o4cZVjhJEOCuP3PeujhkDHtfD42bu2dJVXPQUoj6eCnw=";
    }

    var idRecognizer = BlinkIdCombinedRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    BlinkIdOverlaySettings settings = BlinkIdOverlaySettings();

    var results = await MicroblinkScanner.scanWithCamera(
        RecognizerCollection([idRecognizer]), settings, license);

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
    return buildResult(result.firstName, "First name") +
        buildResult(result.lastName, "Last name") +
        buildResult(result.fullName, "Full name") +
        buildResult(result.localizedName, "Localized name") +
        buildResult(result.additionalNameInformation, "Additional name info") +
        buildResult(result.address, "Address") +
        buildResult(
            result.additionalAddressInformation, "Additional address info") +
        buildResult(result.documentNumber, "Document number") +
        buildResult(
            result.documentAdditionalNumber, "Additional document number") +
        buildResult(result.sex, "Sex") +
        buildResult(result.issuingAuthority, "Issuing authority") +
        buildResult(result.nationality, "Nationality") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildIntResult(result.age, "Age") +
        buildDateResult(result.dateOfIssue, "Date of issue") +
        buildDateResult(result.dateOfExpiry, "Date of expiry") +
        buildResult(result.dateOfExpiryPermanent.toString(),
            "Date of expiry permanent") +
        buildResult(result.maritalStatus, "Martial status") +
        buildResult(result.personalIdNumber, "Personal Id Number") +
        buildResult(result.profession, "Profession") +
        buildResult(result.race, "Race") +
        buildResult(result.religion, "Religion") +
        buildResult(result.residentialStatus, "Residential Status") +
        buildDriverLicenceResult(result.driverLicenseDetailedInfo);
  }

  String buildResult(String result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildDateResult(Date result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildIntResult(int result, String propertyName) {
    if (result < 0) {
      return "";
    }

    return buildResult(result.toString(), propertyName);
  }

  String buildDriverLicenceResult(DriverLicenseDetailedInfo result) {
    if (result == null) {
      return "";
    }

    return buildResult(result.restrictions, "Restrictions") +
        buildResult(result.endorsements, "Endorsements") +
        buildResult(result.vehicleClass, "Vehicle class") +
        buildResult(result.conditions, "Conditions");
  }

  String getPassportResultString(BlinkIdCombinedRecognizerResult result) {
    var dateOfBirth = "";
    if (result.mrzResult.dateOfBirth != null) {
      dateOfBirth = "Date of birth: ${result.mrzResult.dateOfBirth.day}."
          "${result.mrzResult.dateOfBirth.month}."
          "${result.mrzResult.dateOfBirth.year}\n";
    }

    var dateOfExpiry = "";
    if (result.mrzResult.dateOfExpiry != null) {
      dateOfExpiry = "Date of expiry: ${result.mrzResult.dateOfExpiry.day}."
          "${result.mrzResult.dateOfExpiry.month}."
          "${result.mrzResult.dateOfExpiry.year}\n";
    }

    return "First name: ${result.mrzResult.secondaryId}\n"
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

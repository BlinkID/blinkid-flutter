import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

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
      license =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTFNamM1TnpJc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PTYmqMAMVMiFzaNDv15W9/CxDFVRDWRjok+uP0GtswDV4XTVGmhbivKDEb9Gtk2iMzf29qFWF8aUjIES4QSQFJG0xfBXZhluSk7lt4A959aHAZ0+BWgDnqZUPJAF2jZd0Pl2Kt1oDxLtqtf8V/RR+dPYzUV0PEA=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license =
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTNNelkxTmprc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PRIv5OawGAVdpvmuz+999CsJyIAgtV3h96BJo1Fq+xBZnKDoKhL01jBUrxC0E4+EeWoTuEtPPcDte2KHgjOP7Z4y+Mk9ihWDHTjgANWfFwG2Gd7HYJxgwcYQsTvICqS1CBklIILTfbXahwtD4ZKh0ghaxUJf7gU=';
    } else {
      license = "";
    }

    var idRecognizer = BlinkIdMultiSideRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    BlinkIdOverlaySettings settings = BlinkIdOverlaySettings();

    var results = await MicroblinkScanner.scanWithCamera(
        RecognizerCollection([idRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkIdMultiSideRecognizerResult) {

        setState(() {
          _resultString = getIdResultString(result);
          _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
          _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }

    Future<void> directApiMultiSideScan() async {

    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTFNamM1TnpJc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PTYmqMAMVMiFzaNDv15W9/CxDFVRDWRjok+uP0GtswDV4XTVGmhbivKDEb9Gtk2iMzf29qFWF8aUjIES4QSQFJG0xfBXZhluSk7lt4A959aHAZ0+BWgDnqZUPJAF2jZd0Pl2Kt1oDxLtqtf8V/RR+dPYzUV0PEA=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license =
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTNNelkxTmprc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PRIv5OawGAVdpvmuz+999CsJyIAgtV3h96BJo1Fq+xBZnKDoKhL01jBUrxC0E4+EeWoTuEtPPcDte2KHgjOP7Z4y+Mk9ihWDHTjgANWfFwG2Gd7HYJxgwcYQsTvICqS1CBklIILTfbXahwtD4ZKh0ghaxUJf7gU=';
    } else {
      license = "";
    }

    // Pick first image
    final firstImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (firstImage == null) return; // User canceled image picking

    // Convert picked image to base64
    List<int> firstImageBytes = await firstImage.readAsBytes();
    String frontImageBase64 = base64Encode(firstImageBytes);

    // Pick second image
    final secondImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (secondImage == null) return; // User canceled image picking

    // Convert picked image to base64
    List<int> secondImageBytes = await secondImage.readAsBytes();
    String backImageBase64 = base64Encode(secondImageBytes);

    var idRecognizer = BlinkIdMultiSideRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    // Pass the images to the scanWithDirectApi method
    var results = await MicroblinkScanner.scanWithDirectApi(
        RecognizerCollection([idRecognizer]), frontImageBase64, backImageBase64, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkIdMultiSideRecognizerResult) {
        setState(() {
          _resultString = getIdResultString(result);
          _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
          _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }

    Future<void> directApiSingleSideScan() async {

    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTFNamM1TnpJc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PTYmqMAMVMiFzaNDv15W9/CxDFVRDWRjok+uP0GtswDV4XTVGmhbivKDEb9Gtk2iMzf29qFWF8aUjIES4QSQFJG0xfBXZhluSk7lt4A959aHAZ0+BWgDnqZUPJAF2jZd0Pl2Kt1oDxLtqtf8V/RR+dPYzUV0PEA=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license =
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTURnd09EUTNNelkxTmprc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PRIv5OawGAVdpvmuz+999CsJyIAgtV3h96BJo1Fq+xBZnKDoKhL01jBUrxC0E4+EeWoTuEtPPcDte2KHgjOP7Z4y+Mk9ihWDHTjgANWfFwG2Gd7HYJxgwcYQsTvICqS1CBklIILTfbXahwtD4ZKh0ghaxUJf7gU=';
    } else {
      license = "";
    }

      // Pick the image
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return; // User canceled image picking

    // Convert the picked image to base64
    List<int> imageBytes = await image.readAsBytes();
    String imageBase64 = base64Encode(imageBytes);

    var idRecognizer = BlinkIdSingleSideRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    var results = await MicroblinkScanner.scanWithDirectApi(
        RecognizerCollection([idRecognizer]), imageBase64, null, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkIdSingleSideRecognizerResult) {
        setState(() {
          _resultString = getIdResultString(result);
          _fullDocumentFrontImageBase64 = result.fullDocumentImage ?? "";
          _fullDocumentBackImageBase64 = "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }

  String getIdResultString(dynamic result) {
    String recognizerResult = "";
    if (result is BlinkIdMultiSideRecognizerResult || result is BlinkIdSingleSideRecognizer) {
        String recognizerResult = buildResult(result.firstName, "First name") +
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
        "Date of expiry permanent: " +
        result.dateOfExpiryPermanent.toString() +
        "\n" +
        buildResult(result.maritalStatus, "Martial status") +
        buildResult(result.personalIdNumber, "Personal Id Number") +
        buildResult(result.profession, "Profession") +
        buildResult(result.race, "Race") +
        buildResult(result.religion, "Religion") +
        buildResult(result.residentialStatus, "Residential Status") +
        buildDriverLicenceResult(result.driverLicenseDetailedInfo);
        if (result is BlinkIdMultiSideRecognizerResult) {
            recognizerResult += buildDataMatchResult(result.dataMatch);
        }
    }
    print(recognizerResult);
    return recognizerResult;
  }

  String buildResult(StringResult? result, String propertyName) {
    if (result == null ||
        result.description == null ||
        result!.description!.isEmpty) {
      return "";
    }

    return propertyName + ": " + result.description! + "\n";
  }

  String buildDateResult(DateResult? result, String propertyName) {
    if (result == null || result!.date == null || result.date!.year == 0) {
      return "";
    }

    return buildResult(result!.originalDateStringResult, propertyName);
  }

  String buildAdditionalProcessingInfoResult(
      AdditionalProcessingInfo? result, String propertyName) {
    if (result == null) {
      return "empty";
    }

    final missingMandatoryFields = result.missingMandatoryFields;
    String returnString = "";

    if (missingMandatoryFields!.isNotEmpty) {
      returnString = propertyName + ":\n";

      for (var i = 0; i < missingMandatoryFields.length; i++) {
        returnString += missingMandatoryFields[i].name + "\n";
      }
    }

    return returnString;
  }

  String buildStringResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildIntResult(int? result, String propertyName) {
    if (result == null || result < 0) {
      return "";
    }

    return propertyName + ": " + result.toString() + "\n";
  }

  String buildDriverLicenceResult(DriverLicenseDetailedInfo? result) {
    if (result == null) {
      return "";
    }

    return buildResult(result.restrictions, "Restrictions") +
        buildResult(result.endorsements, "Endorsements") +
        buildResult(result.vehicleClass, "Vehicle class") +
        buildResult(result.conditions, "Conditions");
  }

  String buildDataMatchResult(DataMatchResult? result) {
    if (result == null) {
      return "";
    }

    return buildStringResult(result.dateOfBirth.toString(), "Date of birth") +
        buildStringResult(result.dateOfExpiry.toString(), "Date Of Expiry") +
        buildStringResult(result.documentNumber.toString(), "Document Number") +
        buildStringResult(result.stateForWholeDocument.toString(),
            "State For Whole Document");
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
            padding: EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () => scan(),
              child: Text("Scan with camera"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () => directApiMultiSideScan(),
              child: Text("DirectAPI MultiSide"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () => directApiSingleSideScan(),
              child: Text("DirectAPI SingleSide"),
            ),
          ),
          Text(_resultString),
          fullDocumentFrontImage,
          fullDocumentBackImage,
          faceImage,
        ],
      ),
    ),
  ),
);
  }
}

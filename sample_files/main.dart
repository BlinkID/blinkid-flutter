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

  /// BlinkID scanning with camera
  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJeE16YzFPRGN3TWpZc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PYvwosgRYNp1QRJTln5X2YwfBhxia2Zmcp6EaOwdXfDpW992EyNseFmSASo2Yx1zJEEsyGudDGYXE0g16KZtvJx+kIgS66juVst+kf0n38GlYTVZbmLDANY7reEj8J2GHVHY9Kk/OgD2WXDcbpJE9nZmPMgM5Vr5";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license =
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJeE16YzJPVEl5Tmpjc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PbyzAUXcMwR/Z4tMjDjtuRZzCpHBlMqUGaxDKaBeki4WI/hGXZZ9Ntv+KPCCt3jx2ibipTuGzUV1nbBIunAG6aw5tq+S5aSnQ6xWs5YMtyxeNatDxmvbhtRXYLQ61cICRW0VgY7/Qh/KfyI51kL/I5YiGRnBP1ZJ';
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
        if (result.mrzResult?.documentType == MrtdDocumentType.Passport) {
          _resultString = getPassportResultString(result);
        } else {
          _resultString = getIdResultString(result);
        }

        setState(() {
          _resultString = _resultString;
          _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
          _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }
  /// BlinkID scanning with DirectAPI and the BlinkIDMultiSide recognizer.
  /// Best used for getting the information from both front and backside information from various documents
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

    // Pick the front side of the document in the image picker
    final firstImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (firstImage == null) return; // User canceled image picking

    // Convert picked image to base64
    List<int> firstImageBytes = await firstImage.readAsBytes();
    String frontImageBase64 = base64Encode(firstImageBytes);

    // Pick the back side of the document in the image picker
    final secondImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (secondImage == null) return; // User canceled image picking

    // Convert picked image to base64
    List<int> secondImageBytes = await secondImage.readAsBytes();
    String backImageBase64 = base64Encode(secondImageBytes);

    var idRecognizer = BlinkIdMultiSideRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    /// Uncomment line 105 if you're using DirectAPI and you are sending cropped images for processing. 
    /// The processing will most likely not work if cropped images are being sent with the scanCroppedDocumentImage property being set to false */
            
    //idRecognizer.scanCroppedDocumentImage = true;

    // Pass the images to the scanWithDirectApi method
    try {
          var results = await MicroblinkScanner.scanWithDirectApi(
        RecognizerCollection([idRecognizer]), frontImageBase64, backImageBase64, license);

    if (!mounted) return;

    if (results.length == 0) return;

    for (var result in results) {
      if (result is BlinkIdMultiSideRecognizerResult) {
        if (result.mrzResult?.documentType == MrtdDocumentType.Passport) {
          _resultString = getPassportResultString(result);
        } else {
          print(result);
          _resultString = getIdResultString(result);
        }

        setState(() {
          _resultString = _resultString;
          _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
          _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
    } catch (directApiError) {
        if (directApiError is PlatformException) {
          setState(() {
            _resultString = directApiError.message ?? "Unknown error occurred";
            _fullDocumentFrontImageBase64 = "";
            _fullDocumentBackImageBase64 =  "";
            _faceImageBase64 = "";
        });
        } 
    }
  }
  /// BlinkID scanning with DirectAPI and the BlinkIDSingleSide recognizer.
  /// Best used for getting the information from only one side of the various documents
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

    // Pick a document image (it can either be front or the backside of the document)
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // Convert picked image to base64
    List<int> imageBytes = await image.readAsBytes();
    String imageBase64 = base64Encode(imageBytes);

    var idRecognizer = BlinkIdSingleSideRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    /// Uncomment line 176 if you're using DirectAPI and you are sending cropped images for processing. 
    /// The processing will most likely not work if cropped images are being sent with the scanCroppedDocumentImage property being set to false */
            
    //idRecognizer.scanCroppedDocumentImage = true;

    var results = await MicroblinkScanner.scanWithDirectApi(
        RecognizerCollection([idRecognizer]), imageBase64, null, license);

    if (!mounted) return;

    if (results.length == 0) return;

    for (var result in results) {
      if (result is BlinkIdSingleSideRecognizerResult) {
        if (result.mrzResult?.documentType == MrtdDocumentType.Passport) {
          _resultString = getPassportResultString(result);
        } else {
          _resultString = getIdResultString(result);
        }

        setState(() {
          _resultString = _resultString;
          _fullDocumentFrontImageBase64 = result.fullDocumentImage ?? "";
          _fullDocumentBackImageBase64 = "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }

  Future<String> getBase64Image() async {
    List<Asset> resultList = [];
    String base64Image = "";
    try {
      resultList = await MultiImagePicker.pickImages(maxImages: 1);
    } catch (e) {
      // User canceled image picking
      return base64Image;
    }
    // Convert picked image to base64
   if (resultList.isNotEmpty) {
      Asset firstImage = resultList.first;
      ByteData byteData = await firstImage.getByteData();
      List<int> firstImageBytes = byteData.buffer.asUint8List();
      base64Image = base64Encode(firstImageBytes);
    }
    return base64Image;
  }

  String getIdResultString(dynamic result) {
    String stringResult = "";
    if (result is BlinkIdMultiSideRecognizerResult || result is BlinkIdSingleSideRecognizerResult) {
        stringResult = buildResult(result.firstName, "First name") +
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
            stringResult += buildDataMatchResult(result.dataMatch);
        }
    }
    return stringResult;
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

  String getPassportResultString(BlinkIdMultiSideRecognizerResult? result) {
    if (result == null) {
      return "";
    }

    var dateOfBirth = "";
    if (result.mrzResult?.dateOfBirth != null) {
      dateOfBirth = "Date of birth: ${result.mrzResult!.dateOfBirth?.day}."
          "${result.mrzResult!.dateOfBirth?.month}."
          "${result.mrzResult!.dateOfBirth?.year}\n";
    }

    var dateOfExpiry = "";
    if (result.mrzResult?.dateOfExpiry != null) {
      dateOfExpiry = "Date of expiry: ${result.mrzResult?.dateOfExpiry?.day}."
          "${result.mrzResult?.dateOfExpiry?.month}."
          "${result.mrzResult?.dateOfExpiry?.year}\n";
    }

    return "First name: ${result.mrzResult?.secondaryId}\n"
        "Last name: ${result.mrzResult?.primaryId}\n"
        "Document number: ${result.mrzResult?.documentNumber}\n"
        "Sex: ${result.mrzResult?.gender}\n"
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

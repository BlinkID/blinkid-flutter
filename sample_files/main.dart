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
  String license = "";

  /// BlinkID scanning with camera
  Future<void> scan() async {
    try {
      var idRecognizer = BlinkIdMultiSideRecognizer();
      idRecognizer.returnFullDocumentImage = true;
      idRecognizer.returnFaceImage = true;

      BlinkIdOverlaySettings settings = BlinkIdOverlaySettings();

      var results = await MicroblinkScanner.scanWithCamera(RecognizerCollection([idRecognizer]), settings, license);

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
    } catch (scanningError) {
      if (scanningError is PlatformException) {
        setState(() {
          _resultString = scanningError.message ?? "Unknown error occurred";
          _fullDocumentFrontImageBase64 = "";
          _fullDocumentBackImageBase64 = "";
          _faceImageBase64 = "";
        });
      }
    }
  }

  /// BlinkID scanning with DirectAPI and the BlinkIDMultiSide recognizer
  /// Best used for getting the information from both front and backside information from various documents
  Future<void> directApiMultiSideScan() async {
    try {
      // Get the front and the back side of the document with the pickMultiImage method
      // First select the front and the then back side of the image
      final images = await ImagePicker().pickMultiImage();

      // Get the first selected image as the front side of the document
      final firstImage = images[0];
      if (firstImage == null) return;

      // Convert the picked image to the Base64 format
      List<int> firstImageBytes = await firstImage.readAsBytes();
      String frontImageBase64 = base64Encode(firstImageBytes);

      // Get the second selected image as the back side of the document
      final secondImage = images[1];
      if (secondImage == null) return;

      // Convert the picked image to the Base64 format
      List<int> secondImageBytes = await secondImage.readAsBytes();
      String backImageBase64 = base64Encode(secondImageBytes);

      var idRecognizer = BlinkIdMultiSideRecognizer();
      idRecognizer.returnFullDocumentImage = true;
      idRecognizer.returnFaceImage = true;

      /// Uncomment line 96 if you're using scanWithDirectApi and you are sending cropped images for processing
      /// The processing will most likely not work if cropped images are being sent with the scanCroppedDocumentImage property being set to false
      /// idRecognizer.scanCroppedDocumentImage = true;

      // Pass both images to the scanWithDirectApi method
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
    } catch (directApiError) {
      if (directApiError is PlatformException) {
        setState(() {
          _resultString = directApiError.message ?? "Unknown error occurred";
          _fullDocumentFrontImageBase64 = "";
          _fullDocumentBackImageBase64 = "";
          _faceImageBase64 = "";
        });
      }
    }
  }

  /// BlinkID scanning with DirectAPI and the BlinkIDSingleSide recognizer.
  /// Best used for getting the information from only one side from various documents
  Future<void> directApiSingleSideScan() async {
    try {
      // Pick an image of the document (it can either be the front or the back side of the document)
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // Convert the picked image to the Base64 format
      List<int> imageBytes = await image.readAsBytes();
      String imageBase64 = base64Encode(imageBytes);

      var idRecognizer = BlinkIdSingleSideRecognizer();
      idRecognizer.returnFullDocumentImage = true;
      idRecognizer.returnFaceImage = true;

      /// Uncomment line 148 if you're using scanWithDirectApi and you are sending a cropped image for processing
      /// The processing will most likely not work if a cropped image is being sent with the scanCroppedDocumentImage property being set to false
      /// idRecognizer.scanCroppedDocumentImage = true;

      var results =
          await MicroblinkScanner.scanWithDirectApi(RecognizerCollection([idRecognizer]), imageBase64, null, license);

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
    } catch (directApiError) {
      if (directApiError is PlatformException) {
        setState(() {
          _resultString = directApiError.message ?? "Unknown error occurred";
          _fullDocumentFrontImageBase64 = "";
          _fullDocumentBackImageBase64 = "";
          _faceImageBase64 = "";
        });
      }
    }
  }

  String getIdResultString(dynamic result) {
    String recognizerResult = "";
    if (result is BlinkIdMultiSideRecognizerResult || result is BlinkIdSingleSideRecognizerResult) {
      recognizerResult = buildResult(result.firstName, "First name") +
          buildResult(result.lastName, "Last name") +
          buildResult(result.fullName, "Full name") +
          buildResult(result.localizedName, "Localized name") +
          buildResult(result.additionalNameInformation, "Additional name info") +
          buildResult(result.address, "Address") +
          buildResult(result.additionalAddressInformation, "Additional address info") +
          buildResult(result.documentNumber, "Document number") +
          buildResult(result.documentAdditionalNumber, "Additional document number") +
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
    return recognizerResult;
  }

  String buildResult(StringResult? result, String propertyName) {
    if (result == null || result.description == null || result!.description!.isEmpty) {
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

  String buildAdditionalProcessingInfoResult(AdditionalProcessingInfo? result, String propertyName) {
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
        buildStringResult(result.stateForWholeDocument.toString(), "State For Whole Document");
  }

  Future<void> showAlertDialog(BuildContext context, String title, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTWpZeU1qUTBOREV4TlRVc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PT1RBvlVFNnN5vSYtKXoYbxdgauBZh+zoCoAdYK7mPUsKpG6LIuSiHpwxpmgMOvzqm9rHsPzSBlPkEymEZhziTn3mwBFPNp4d2N52K9XL8H811OyN1FJ38zN4OYVhnVJsqMzSRO37uj1XGwgt4yYmHaDQpvQYxABww==";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license =
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTWpZeU1qUTBPVEl5TWpZc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PXQNidKfA1+JdDcfPUPR44JcbqkbzQ867V6RVb/irLycCeXhuw6vU9xzTRiZBod5rUu3UqBuhDLKEnNQP/shO/+3931MB0f0h0+v+OhD9o5I7mpEDBUtWom9CcBUTmeopg1xVK33nDCdvbSG4uIcMnDxRIDtvBuGUA==';
    } else {
      license = "";
    }

    Widget fullDocumentFrontImage = Container();
    if (_fullDocumentFrontImageBase64 != null && _fullDocumentFrontImageBase64 != "") {
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
    if (_fullDocumentBackImageBase64 != null && _fullDocumentBackImageBase64 != "") {
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
          child: Builder(
            builder: (BuildContext context) {
              return Column(
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
                      onPressed: () {
                        showAlertDialog(context, 'DirectAPI MultiSide instructions',
                                'Select two images for processing.\nThe first selected image needs to be front side of the document.\nThe second image needs to be the back side of the document.')
                            .then((_) {
                          directApiMultiSideScan();
                        });
                      },
                      child: Text("DirectAPI MultiSide"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog(context, 'DirectAPI SingleSide instructions',
                                'Select one image for processing.\nThe image can be either the front or the back side of the document.')
                            .then((_) {
                          directApiSingleSideScan();
                        });
                      },
                      child: Text("DirectAPI SingleSide"),
                    ),
                  ),
                  Text(_resultString),
                  fullDocumentFrontImage,
                  fullDocumentBackImage,
                  faceImage,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

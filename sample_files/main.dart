import 'dart:io';

import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';
import 'package:flutter/material.dart';
import "dart:async";
import 'package:flutter/services.dart';
import 'package:blinkid_flutter/blinkid_flutter.dart';
import "dart:convert";
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String resultString = "";
  String firstDocumentImageBase64 = "";
  String secondDocumentImageBase64 = "";
  String faceImageBase64 = "";
  String signatureImageBase64 = "";
  String sdkLicenseKey = "";

  final blinkIdPlugin = BlinkidFlutter();

  Future<void> performScan() async {
    try {
      /// Set the BlinkID SDK settings
      final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
      sdkSettings.downloadResources = true;

      /// Create and modify the Session Settings
      final sessionSettings = BlinkIdSessionSettings();
      sessionSettings.scanningMode = ScanningMode.automatic;

      /// Create and modify the scanning settings
      final scanningSettings = BlinkIdScanningSettings();
      // scanningSettings.anonymizationMode = AnonymizationMode.none;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      final filter = DocumentFilter.country(Country.Croatia);
      final filterTwo = DocumentFilter.typeRegion(
        DocumentType.Dl,
        Region.California,
      );

      final documentRules = [
        DocumentRules([
          DetailedFieldType(FieldType.Address, AlphabetType.Latin),
          DetailedFieldType(FieldType.FirstName, AlphabetType.Latin),
        ], filter),
        DocumentRules([
          DetailedFieldType(FieldType.Address, AlphabetType.Latin),
          DetailedFieldType(FieldType.FirstName, AlphabetType.Latin),
        ], filterTwo),
      ];

      scanningSettings.customDocumentRules = documentRules;

      final additionalAnonSettings =
          DocumentAnonymizationSettings.withAllParameters(
            [FieldType.FirstName, FieldType.Address],
            filter,
            DocumentNumberAnonymizationSettings.withAllParemeters(1, 2),
          );
      final additionalAnonSettingsTwo = DocumentAnonymizationSettings([
        FieldType.BloodType,
        FieldType.Address,
      ]);

      scanningSettings.customDocumentAnonymizationSettings = [
        additionalAnonSettings,
        additionalAnonSettingsTwo,
      ];

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;
      final classFilter = ClassFilter();
      classFilter.includeDocuments = [
        DocumentFilter.country(Country.Usa),
        DocumentFilter.countryRegion(Country.Usa, Region.California),
      ];
      classFilter.excludeDocuments = [
        DocumentFilter.country(Country.Croatia),
        DocumentFilter.typeRegion(DocumentType.Dl, Region.Texas),
      ];

      /// call the 'performScan' method and handle the results
      await blinkIdPlugin
          .performScan(sdkSettings, sessionSettings) //, classFilter)
          .then((result) {
            setState(() {
              if (result != null) {
                resultString = getIdResultString(result);
                if (result.firstDocumentImage != null) {
                  firstDocumentImageBase64 = result.firstDocumentImage!;
                }
                if (result.secondDocumentImage != null) {
                  secondDocumentImageBase64 = result.secondDocumentImage!;
                }
                if (result.faceImage != null) {
                  faceImageBase64 = result.faceImage!.image!;
                }
                if (result.signatureImage != null) {
                  signatureImageBase64 = result.signatureImage!.image!;
                }
              }
            });
          })
          .catchError((scanningError) {
            setState(() {
              if (scanningError is PlatformException) {
                final errorMessage = scanningError.message;
                resultString = "BlinkID scanning error: $errorMessage";
                firstDocumentImageBase64 = "";
                secondDocumentImageBase64 = "";
                faceImageBase64 = "";
                signatureImageBase64 = "";
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
        });
      }
    }
  }

  Future<void> directApiMultiSideScan() async {
    try {
      // Get the front and the back side of the document with the pickMultiImage method
      // First select the front and the then back side of the image
      final images = await ImagePicker().pickMultiImage();

      // Convert the first picked image to the Base64 format
      String frontImageBase64 = base64Encode(await images[0].readAsBytes());

      // Get the second selected image as the back side of the document
      // Convert the picked image to the Base64 format
      String backImageBase64 = base64Encode(await images[1].readAsBytes());

      final blinkIdPlugin = BlinkidFlutter();

      /// Set the BlinkID SDK settings
      final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
      sdkSettings.downloadResources = true;

      /// Create and modify the Session Settings
      final sessionSettings = BlinkIdSessionSettings();
      sessionSettings.scanningMode = ScanningMode.automatic;

      /// Create and modify the scanning settings
      final scanningSettings = BlinkIdScanningSettings();
      scanningSettings.anonymizationMode = AnonymizationMode.none;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// call the 'performScan' method and handle the results
      await blinkIdPlugin
          .performDirectApiScan(
            sdkSettings,
            sessionSettings,
            frontImageBase64,
            backImageBase64,
          )
          .then((result) {
            setState(() {
              if (result != null) {
                resultString = getIdResultString(result);
                if (result.firstDocumentImage != null) {
                  firstDocumentImageBase64 = result.firstDocumentImage!;
                }
                if (result.secondDocumentImage != null) {
                  secondDocumentImageBase64 = result.secondDocumentImage!;
                }
                if (result.faceImage != null) {
                  faceImageBase64 = result.faceImage!.image!;
                }
                if (result.signatureImage != null) {
                  signatureImageBase64 = result.signatureImage!.image!;
                }
              }
            });
          })
          .catchError((scanningError) {
            setState(() {
              if (scanningError is PlatformException) {
                final errorMessage = scanningError.message;
                resultString = "BlinkID scanning error: $errorMessage";
                firstDocumentImageBase64 = "";
                secondDocumentImageBase64 = "";
                faceImageBase64 = "";
                signatureImageBase64 = "";
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
        });
      }
    }
  }

  Future<void> directApiSingleSideScan() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // Convert the picked image to the Base64 format
      String imageBase64 = base64Encode(await image.readAsBytes());

      final blinkIdPlugin = BlinkidFlutter();

      /// Set the BlinkID SDK settings
      final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
      sdkSettings.downloadResources = true;

      /// Create and modify the Session Settings
      final sessionSettings = BlinkIdSessionSettings();
      sessionSettings.scanningMode = ScanningMode.single;

      /// Create and modify the scanning settings
      final scanningSettings = BlinkIdScanningSettings();
      scanningSettings.anonymizationMode = AnonymizationMode.none;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// call the 'performScan' method and handle the results
      await blinkIdPlugin
          .performDirectApiScan(sdkSettings, sessionSettings, imageBase64)
          .then((result) {
            setState(() {
              if (result != null) {
                resultString = getIdResultString(result);
                if (result.firstDocumentImage != null) {
                  firstDocumentImageBase64 = result.firstDocumentImage!;
                }
                secondDocumentImageBase64 = "";
                if (result.faceImage != null) {
                  faceImageBase64 = result.faceImage!.image!;
                }
                if (result.signatureImage != null) {
                  signatureImageBase64 = result.signatureImage!.image!;
                }
              }
            });
          })
          .catchError((scanningError) {
            setState(() {
              if (scanningError is PlatformException) {
                final errorMessage = scanningError.message;
                resultString = "BlinkID scanning error: $errorMessage";
                firstDocumentImageBase64 = "";
                secondDocumentImageBase64 = "";
                faceImageBase64 = "";
                signatureImageBase64 = "";
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
        });
      }
    }
  }

  String getIdResultString(BlinkIdScanningResult? result) {
    if (result != null) {
      return "Recognition mode: ${result.recognitionMode?.name}\n" +
          buildResult(result.firstName, "First name") +
          buildResult(result.lastName, "Last name") +
          buildResult(result.fullName, "Full name") +
          buildResult(result.localizedName, "Localized name") +
          buildResult(
            result.additionalNameInformation,
            "Additional name info",
          ) +
          buildResult(result.address, "Address") +
          buildResult(
            result.additionalAddressInformation,
            "Additional address info",
          ) +
          buildResult(result.documentNumber, "Document number") +
          buildResult(
            result.documentAdditionalNumber,
            "Additional document number",
          ) +
          buildResult(result.sex, "Sex") +
          buildResult(result.issuingAuthority, "Issuing authority") +
          buildResult(result.nationality, "Nationality") +
          buildDateResult(result.dateOfBirth, "Date of birth") +
          buildDateResult(result.dateOfIssue, "Date of issue") +
          buildDateResult(result.dateOfExpiry, "Date of expiry") +
          buildResult(result.maritalStatus, "Martial status") +
          buildResult(result.personalIdNumber, "Personal Id Number") +
          buildResult(result.profession, "Profession") +
          buildResult(result.race, "Race") +
          buildResult(result.religion, "Religion") +
          buildResult(result.residentialStatus, "Residential Status") +
          buildDriverLicenceResult(result.driverLicenseDetailedInfo) +
          buildDataMatchResult(result.dataMatchResult) +
          buildDocumentClassInfoResult(result.documentClassInfo) +
          buildSubresults(result.subResults);
    }
    return "";
  }

  String buildSubresults(List<SingleSideScanningResult>? subResults) {
    String subResultsString = "";
    if (subResults != null) {
      for (var singleSideResult in subResults.asMap().entries) {
        final index = singleSideResult.key;
        final result = singleSideResult.value;

        subResultsString += "\nDocument side ${index + 1} information:\n";
        subResultsString += buildVizResult(result.viz);
        subResultsString += buildMrzResult(result.mrz);
        subResultsString += buildBarcodeResult(result.barcode);
      }
    }
    return subResultsString;
  }

  String buildMrzResult(MrzResult? result) {
    if (result == null) {
      return "";
    }

    return "\nMRZ result:\n" +
        buildStringResult(result.documentCode, "Document code") +
        buildStringResult(result.documentNumber, "Document number") +
        buildStringResult(result.gender, "Gender") +
        buildStringResult(result.issuer, "Issuer") +
        buildStringResult(result.issuerName, "Issuer name") +
        buildStringResult(result.nationality, "Nationality") +
        buildStringResult(result.nationalityName, "Nationality name") +
        buildStringResult(result.opt1, "Opt1") +
        buildStringResult(result.opt2, "Opt2") +
        buildStringResult(result.primaryID, "Primary ID") +
        buildStringResult(result.secondaryID, "Secondary ID") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry");
  }

  String buildBarcodeResult(BarcodeResult? result) {
    if (result == null) {
      return "";
    }
    return "\nBarcode result:\n" +
        buildStringResult(
          result.additionalNameInformation,
          "Additional name information",
        ) +
        buildStringResult(result.address, "Address") +
        buildStringResult(
          result.documentAdditionalNumber,
          "Document additional number",
        ) +
        buildStringResult(result.documentNumber, "Document number") +
        buildStringResult(result.employer, "Employer") +
        buildStringResult(result.firstName, "First name") +
        buildStringResult(result.lastName, "Last name") +
        buildStringResult(result.fullName, "Full name") +
        buildStringResult(result.issuingAuthority, "Issuing authority") +
        buildStringResult(result.maritalStatus, "Marital status") +
        buildStringResult(result.nationality, "Nationality") +
        buildStringResult(result.personalIdNumber, "Personal ID number") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry") +
        buildDateResult(result.dateOfIssue, "Date of issue");
  }

  String buildVizResult(VizResult? result) {
    if (result == null) {
      return "";
    }
    return "\nVIZ result:\n" +
        buildResult(
          result.additionalAddressInformation,
          "Additional address information",
        ) +
        buildResult(
          result.additionalNameInformation,
          "Additional name information",
        ) +
        buildResult(result.address, "Address") +
        buildResult(result.bloodType, "Blood type") +
        buildResult(result.documentNumber, "Document number") +
        buildResult(result.documentSubtype, "Document subtype") +
        buildResult(result.employer, "Employer") +
        buildResult(result.firstName, "First name") +
        buildResult(result.lastName, "Last name") +
        buildResult(result.fullName, "Full name") +
        buildResult(result.issuingAuthority, "Issuing authority") +
        buildResult(result.maritalStatus, "Marital status") +
        buildResult(result.nationality, "Nationality") +
        buildResult(result.placeOfBirth, "Place of birth") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry") +
        buildDateResult(result.dateOfIssue, "Nationality");
  }

  String buildResult(StringResult? result, String propertyName) {
    if (result == null || result.value == null || result!.value!.isEmpty) {
      return "";
    }

    return "$propertyName: ${result.value!}\n";
  }

  String buildDocumentClassInfoResult(DocumentClassInfo? result) {
    if (result == null) {
      return "";
    }

    return "\nDocument class information:\nCountry: ${result.country?.name}\nRegion:${result.region?.name}\nDocument type: ${result.documentType?.name}\n";
  }

  String buildDateResult(DateResult? result, String propertyName) {
    if (result == null || result!.date == null || result.date!.year == 0) {
      return "";
    }
    if (result.originalString is StringResult) {
      return buildResult(result.originalString, propertyName);
    } else {
      return buildStringResult(result.originalString, propertyName);
    }
  }

  String buildStringResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return "$propertyName: $result\n";
  }

  String buildIntResult(int? result, String propertyName) {
    if (result == null || result < 0) {
      return "";
    }

    return "$propertyName: $result\n";
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

  String buildDataMatchResult(DataMatchResult? dataMatchresult) {
    if (dataMatchresult == null) {
      return "";
    }

    String dataMatchResultString =
        "\nData match information:\nState for whole document: ${dataMatchresult.overallState?.name}\n";

    for (DataMatchResultField field in dataMatchresult!.states!) {
      dataMatchResultString += "${field.field?.name}: ${field.state?.name}\n";
    }
    return dataMatchResultString;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTkRVek9UVXpNelV3TWpnc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PT9ntCaTnqVQtm4xCnDsf6LGNiRcS+wJvDbVnmIzKk4hnXbAzz2S7i3rYBV2hgkyzChru7lZwjxNp8QppVtFK3lMMQxBRparnu1n/SFC23M1VxqQlE1xF2PYdUXhdA==";
    } else if (Platform.isIOS) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTkRVek9UVXpOekUwTmpNc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PeHKYUyGFbhY5Ro2y0K5nUW8aP44565wqKiAaN0IJjO4IA6/7tV+eAVUzWmGcyspxafJ4PagcjrdhJP9v38En5h/qsO7eAluRcVOgjNF0Ku4gxjy6BY/s3ffrdEJEw==";
    }

    Widget firstDocumentImage = Container();
    if (firstDocumentImageBase64 != null && firstDocumentImageBase64 != "") {
      firstDocumentImage = Column(
        children: <Widget>[
          Text("First document image:"),
          Image.memory(
            Base64Decoder().convert(firstDocumentImageBase64),
            height: 180,
            width: 350,
          ),
        ],
      );
    }

    Widget secondDocumentImage = Container();
    if (secondDocumentImageBase64 != null && secondDocumentImageBase64 != "") {
      secondDocumentImage = Column(
        children: <Widget>[
          Text("Second document image:"),
          Image.memory(
            Base64Decoder().convert(secondDocumentImageBase64),
            height: 180,
            width: 350,
          ),
        ],
      );
    }

    Widget faceImage = Container();
    if (faceImageBase64 != null && faceImageBase64 != "") {
      faceImage = Column(
        children: <Widget>[
          Text("Face Image:"),
          Image.memory(
            Base64Decoder().convert(faceImageBase64),
            height: 150,
            width: 100,
          ),
        ],
      );
    }

    Widget signatureImage = Container();
    if (signatureImageBase64 != "") {
      signatureImage = Column(
        children: <Widget>[
          Text("Signature Image:"),
          Image.memory(
            Base64Decoder().convert(signatureImageBase64),
            height: 150,
            width: 100,
          ),
        ],
      );
    }

    Future<void> showAlertDialog(
      BuildContext context,
      String title,
      String message,
    ) async {
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("BlinkID Sample")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () => performScan(),
                      child: Text("Scan with camera"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog(
                          context,
                          'DirectAPI MultiSide instructions',
                          'Select two images for processing.\nThe first selected image needs to be front side of the document.\nThe second image needs to be the back side of the document.',
                        ).then((_) {
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
                        showAlertDialog(
                          context,
                          'DirectAPI SingleSide instructions',
                          'Select one image for processing.\nThe image can be either the front or the back side of the document.',
                        ).then((_) {
                          directApiSingleSideScan();
                        });
                      },
                      child: Text("DirectAPI SingleSide"),
                    ),
                  ),
                  Text(resultString),
                  firstDocumentImage,
                  secondDocumentImage,
                  faceImage,
                  signatureImage,
                ],
              );
            },
          ),
        ),
      ),
    ),
  ),
);
  }
}


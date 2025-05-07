import 'dart:io';
import 'package:flutter/material.dart';
import "dart:async";
import 'package:flutter/services.dart';
import "dart:convert";
import 'package:image_picker/image_picker.dart';

/// import the blinkid_flutter package
import 'package:blinkid_flutter/blinkid_flutter.dart';
import 'blinkid_result_builder.dart';

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

  @override
  void initState() {
    super.initState();

    /// Add a valid license key, based on the platform
    /// A valid license key can be obtained from the Microblink Developer Hub, here: https://developer.microblink.com
    if (Platform.isAndroid) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTkRRNE56UTBOVEEzTURrc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9PQFqJ4q5cbrifIIzl/hZUv6kE1yuVi9JtleDjJowLJ8dNiwAGk1UsePWt8CO8WUH/+i1YBKciSxRfqFkTiMpPsLKEGvQ1zVG+3HZ4C4PMTwSEgtFu7HayF1P6Z7Bsb0=";
    } else if (Platform.isIOS) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTkRReE1ETTFOell6TVRjc0lrTnlaV0YwWldSR2IzSWlPaUkwT1RabFpEQXpaUzAwT0RBeExUUXpZV1F0WVRrMU5DMDBNemMyWlRObU9UTTVNR1FpZlE9Pa1EwEJ3KLtMGjfmgRGOpUrMLWyfJe7tCCCLMuyeuP25X0o8dUrLuPg+7SIra6+iruDS6gp8ksWoJ6jr3E1by7OALtyBtgV2jj16iY8GZM6nDBl+gBjDjPZu7qxD3yo=";
    }
  }

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

      final filter = DocumentFilter(Country.croatia);
      final filterTwo = DocumentFilter(
        null,
        Region.california,
        DocumentType.dl,
      );

      /// DOCUMENT RULES
      final documentRules = [
        DocumentRules([
          DetailedFieldType(FieldType.address, AlphabetType.latin),
          DetailedFieldType(FieldType.firstName, AlphabetType.latin),
        ], filter),
        DocumentRules([
          DetailedFieldType(FieldType.address, AlphabetType.latin),
          DetailedFieldType(FieldType.firstName, AlphabetType.latin),
        ], filterTwo),
      ];

      scanningSettings.customDocumentRules = documentRules;

      /// ADDITIONAL ANONYMIZATION SETTINGS
      final additionalAnonSettings = DocumentAnonymizationSettings(
        [FieldType.firstName, FieldType.address],
        filter,
        DocumentNumberAnonymizationSettings.withAllParameters(1, 2),
      );

      final additionalAnonSettingsTwo = DocumentAnonymizationSettings([
        FieldType.bloodType,
        FieldType.address,
      ]);

      scanningSettings.customDocumentAnonymizationSettings = [
        additionalAnonSettings,
        additionalAnonSettingsTwo,
      ];

      /// RECOGNITION MODE FILTER
      final recognitionModeFilter = RecognitionModeFilter();
      recognitionModeFilter.enableBarcodeId = true;
      recognitionModeFilter.enableFullDocumentRecognition = true;
      recognitionModeFilter.enableMrzId = true;
      recognitionModeFilter.enableMrzPassport = true;
      recognitionModeFilter.enableMrzVisa = true;
      recognitionModeFilter.enablePhotoId = true;

      scanningSettings.recognitionModeFilter = recognitionModeFilter;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// CLASS FILTER
      final classFilter = ClassFilter();
      classFilter.includeDocuments = [
        DocumentFilter(Country.usa),
        DocumentFilter(Country.usa, Region.california),
      ];
      classFilter.excludeDocuments = [
        DocumentFilter(Country.croatia),
        DocumentFilter(null, Region.texas, DocumentType.dl),
      ];

      /// call the 'performScan' method and handle the results
      await blinkIdPlugin
          .performScan(sdkSettings, sessionSettings) //, classFilter)
          .then((result) {
            resetImages();
            setState(() {
              if (result != null) {
                resultString = BlinkIdResultBuilder.getIdResultString(result);
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
                resetImages();
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
          resetImages();
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
              resetImages();
              if (result != null) {
                resultString = BlinkIdResultBuilder.getIdResultString(result);
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
                resetImages();
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
          resetImages();
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
              resetImages();
              if (result != null) {
                resultString = BlinkIdResultBuilder.getIdResultString(result);
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
                resetImages();
              }
            });
          });
    } catch (blinkidScanningError) {
      if (blinkidScanningError is PlatformException) {
        final errorMessage = blinkidScanningError.message;
        setState(() {
          resultString = "BlinkID scanning error: $errorMessage";
          resetImages();
        });
      }
    }
  }

  void resetImages() {
    firstDocumentImageBase64 = "";
    secondDocumentImageBase64 = "";
    faceImageBase64 = "";
    signatureImageBase64 = "";
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

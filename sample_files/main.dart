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
  String sdkLicenseKey = "";
  String resultString = "";

  String firstDocumentImageBase64 = "";
  String secondDocumentImageBase64 = "";
  String faceImageBase64 = "";
  String signatureImageBase64 = "";

  String firstInputImageBase64 = "";
  String secondInputImageBase64 = "";
  String barcodeInputImageBase64 = "";

  /// Initialize the BlinkID plugin
  ///
  /// It will be used both for the default UX scan (performScan method),
  /// and the DirectAPI scan (directApiMultiSideScan and directApiSingleSideScan methods).
  final blinkIdPlugin = BlinkidFlutter();

  @override
  void initState() {
    super.initState();

    /// Add a valid license key, based on the platform
    /// A valid license key can be obtained from the Microblink Developer Hub, here: https://developer.microblink.com
    if (Platform.isAndroid) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTmpJeE56QTRNakF3TkRRc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PRpURkVPwuO0koYgtsId0UoOnkvZdrc5+ewfldLFcoG9SoE1NurAQ6fYusivk5aUxIRrbWM7ak7bZfr/Y8ud9ayh2GEgB96T6uufqumXoW22/XJDPAcU4Mp8uzbIjps=";
    } else if (Platform.isIOS) {
      sdkLicenseKey =
          "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTmpJeE56QTROVE01Tnpnc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PYp8/JA4wSFGiNehLMfx8e5TtiIcdUR0YKx2/x/XlY+a10Qzw9Jsm/+aZS0QMqn14qrI6pmDxwkACGS4XkicR81ECuJIKtxe+7Tc/rLcmO2wjnFwuATJm69ERvdGDPw=";
    }

    // If neccessary, the SDK can be pre-loaded with the neccessary resources before the scanning session starts.
    // This will decreasing the SDK loading time when starting a scanning session (since the resources will be downloaded and the license verified).

    // blinkIdPlugin.loadBlinkIdSdk(BlinkIdSdkSettings(sdkLicenseKey));
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
      scanningSettings.anonymizationMode = AnonymizationMode.fullResult;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;
      scanningSettings.blurDetectionLevel = DetectionLevel.mid;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// Create and modify the UX settings
      /// This paramater is optional
      final uiSettings = BlinkIdScanningUxSettings();
      uiSettings.showHelpButton = true;
      uiSettings.showOnboardingDialog = false;
      uiSettings.allowHapticFeedback = true;
      uiSettings.preferredCamera = PreferredCamera.back;

      /// Place the optional ClassFilter class
      /// The filter is currently modified to only accept Canada documents, and USA California documents
      final classFilter = ClassFilter.withIncludedDocumentClasses([
        DocumentFilter(Country.canada),
        DocumentFilter(Country.usa, Region.california),
      ]);

      /// Call the 'performScan' method and handle the results
      /// Check how the results are handled in the blinkid_result_builder.dart file
      await blinkIdPlugin
          .performScan(
            sdkSettings,
            sessionSettings,
            uiSettings,
          ) //, classFilter)
          .then((result) {
            resetImages();
            setState(() {
              if (result != null) {
                resultString = BlinkIdResultBuilder.getIdResultString(result);
                setImages(result);
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
      /// Get the front and the back side of the document with the pickMultiImage method
      /// First select the front and the then back side of the image
      final images = await ImagePicker().pickMultiImage();

      /// Convert the first picked image to the Base64 format
      String frontImageBase64 = base64Encode(await images[0].readAsBytes());

      /// Get the second selected image as the back side of the document
      /// Convert the picked image to the Base64 format
      String backImageBase64 = base64Encode(await images[1].readAsBytes());

      /// Set the BlinkID SDK settings
      final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
      sdkSettings.downloadResources = true;

      /// Create and modify the Session Settings
      final sessionSettings = BlinkIdSessionSettings();
      sessionSettings.scanningMode = ScanningMode.automatic;

      /// Create and modify the scanning settings
      final scanningSettings = BlinkIdScanningSettings();
      scanningSettings.anonymizationMode = AnonymizationMode.fullResult;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;

      /// Uncomment the following line if you are passing input images
      /// that consist solely of the cropped document image.
      ///
      /// scanningSettings.scanCroppedDocumentImage = true;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// Call the 'performDirectApiScan' method and handle the results
      /// Check how the results are handled in the blinkid_result_builder.dart file
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
                setImages(result);
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
      /// Get either the front or the back side of the document with the pickImage method
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      /// Convert the picked image to the Base64 format
      String imageBase64 = base64Encode(await image.readAsBytes());

      /// Set the BlinkID SDK settings
      final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
      sdkSettings.downloadResources = true;

      /// Create and modify the Session Settings
      final sessionSettings = BlinkIdSessionSettings();
      sessionSettings.scanningMode = ScanningMode.single;

      /// Create and modify the scanning settings
      final scanningSettings = BlinkIdScanningSettings();
      scanningSettings.anonymizationMode = AnonymizationMode.fullResult;
      scanningSettings.glareDetectionLevel = DetectionLevel.mid;

      /// Uncomment the following line if you are passing input images
      /// that consist solely of the cropped document image.
      ///
      /// scanningSettings.scanCroppedDocumentImage = true;

      /// Create and modify the Image settings
      final imageSettings = CroppedImageSettings();
      imageSettings.returnDocumentImage = true;
      imageSettings.returnSignatureImage = true;
      imageSettings.returnFaceImage = true;

      /// Place the image settings in the scanning settings
      scanningSettings.croppedImageSettings = imageSettings;

      /// Place the Scanning settings in the Session settings
      sessionSettings.scanningSettings = scanningSettings;

      /// Call the 'performDirectApiScan' method and handle the results
      /// Check how the results are handled in the blinkid_result_builder.dart file
      await blinkIdPlugin
          .performDirectApiScan(sdkSettings, sessionSettings, imageBase64)
          .then((result) {
            setState(() {
              resetImages();
              if (result != null) {
                resultString = BlinkIdResultBuilder.getIdResultString(result);
                setImages(result);
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

  void setImages(BlinkIdScanningResult? result) {
    if (result?.firstDocumentImage != null) {
      firstDocumentImageBase64 = result!.firstDocumentImage!;
    }
    if (result?.secondDocumentImage != null) {
      secondDocumentImageBase64 = result!.secondDocumentImage!;
    }
    if (result?.faceImage != null) {
      faceImageBase64 = result!.faceImage!.image!;
    }
    if (result?.signatureImage != null) {
      signatureImageBase64 = result!.signatureImage!.image!;
    }
    if (result?.firstInputImage != null) {
      firstInputImageBase64 = result!.firstInputImage!;
    }
    if (result?.secondInputImage != null) {
      secondInputImageBase64 = result!.secondInputImage!;
    }
    if (result?.barcodeInputImage != null) {
      barcodeInputImageBase64 = result!.barcodeInputImage!;
    }
  }

  void resetImages() {
    firstDocumentImageBase64 = "";
    secondDocumentImageBase64 = "";
    firstInputImageBase64 = "";
    secondInputImageBase64 = "";
    faceImageBase64 = "";
    signatureImageBase64 = "";
  }

  @override
  Widget build(BuildContext context) {
    Widget firstDocumentImage = Container();
    if (firstDocumentImageBase64 != "") {
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
    if (secondDocumentImageBase64 != "") {
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
    Widget firstInputImage = Container();
    if (firstInputImageBase64 != "") {
      firstInputImage = Column(
        children: <Widget>[
          Text("First input image:"),
          Image.memory(
            Base64Decoder().convert(firstInputImageBase64),
            height: 180,
            width: 350,
          ),
        ],
      );
    }
    Widget secondInputImage = Container();
    if (secondInputImageBase64 != "") {
      secondInputImage = Column(
        children: <Widget>[
          Text("Second input image:"),
          Image.memory(
            Base64Decoder().convert(secondInputImageBase64),
            height: 180,
            width: 350,
          ),
        ],
      );
    }
    Widget barcodeInputImage = Container();
    if (barcodeInputImageBase64 != "") {
      barcodeInputImage = Column(
        children: <Widget>[
          Text("Barcode input image:"),
          Image.memory(
            Base64Decoder().convert(barcodeInputImageBase64),
            height: 180,
            width: 350,
          ),
        ],
      );
    }

    Widget faceImage = Container();
    if (faceImageBase64 != "") {
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
                  firstInputImage,
                  secondInputImage,
                  barcodeInputImage,
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

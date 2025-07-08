<p align="center" >
  <img src="https://raw.githubusercontent.com/wiki/blinkid/blinkid-android/images/logo-microblink.png" alt="Microblink" title="Microblink">
</p>

# _BlinkID_ Flutter plugin

The BlinkID SDK is a comprehensive solution for implementing secure document scanning on the Flutter cross-platform.
It offers powerful capabilities for capturing and analyzing a wide range of identification documents. The Flutter plugin consists of BlinkID, which serves as the core module, and the BlinkIDUX package that provides a complete, ready-to-use solution with a user-friendly interface.

**Please note that, for maximum performance and full access to all features, it’s best to go with one of our native SDKs (for [iOS](https://github.com/BlinkID/blinkid-ios) or [Android](https://github.com/BlinkID/blinkid-android)).**

However, since the wrapper is open source, you can add the features you need on your own.

# Table of contents
- [Licensing](#licensing)
- [Requirements](#requirements)
- [Quickstart with the sample application](#quickstart-with-the-sample-application)
- [Plugin integration](#plugin-integration)
- [Plugin usage](#plugin-usage)
- [Plugin specifics](#plugin-specifics)
  - [Scanning methods](#scanning-methods)
  - [BlinkID Settings](#blinkid-settings)
  - [BlinkID Results](#blinkid-results)
- [Additional information](#additional-information)

## <a name="licensing"></a> Licensing
A valid license key is required to initialize the BlinkID plugin. A free trial license key can be requested after registering at the [Microblink Developer Hub](https://developer.microblink.com/).

## <a name="requirements"></a> Requirements

| Requirement        | Flutter                | iOS                    | Android                   |
|:------------------:|:----------------------:|:----------------------:|:-------------------------:|
| OS/API version     | Flutter 3.29 and newer  | iOS 16.0 and newer      | API version 24 and newer   |
| Camera quality     | -                       | At least 1080p          | At least 1080p             |


- For additional help with the Flutter setup, view the official [documentation](https://flutter.dev/docs).
- For more detailed information about the BlinkID Android and iOS requirements, view the native SDK documentation here ([Android](https://github.com/BlinkID/blinkid-android?tab=readme-ov-file#-device-requirements) & [iOS](https://github.com/BlinkID/blinkid-ios?tab=readme-ov-file#requirements)).


## <a name="quickstart-with-the-sample-application"></a> Quickstart with the sample application
The sample application demonstrates how the BlinkID plugin is implemented, used and shows how to obtain the scanned results. It contains the implementation for:
1. The **default implementation** with the default BlinkID UX scanning experience.
2. **Multiside DirectAPI scanning** - extracting the document information from multiple static images (from the gallery).
3. **Singleside DirectAPI scanning** - extracting the document information from a single static images (from the gallery).

To obtain and run the sample application, follow the steps below:
1. Git clone the repository:
```bash
git clone https://github.com/BlinkID/blinkid-flutter.git
```
2. Position to the obtained BlinkID folder and run the `initBlinkIdFlutterSample.sh` script:
```bash
cd blinkid-flutter && ./initBlinkIdFlutterSample.sh
```
3. After the script finishes running, position to the `sample` folder and run the `flutter run` command:
```bash
cd sample && flutter run
```
4. Pick the platform to run the BlinkID plugin on.

Note: the plugin can be run directly via Xcode (iOS) and Android Studio (Android):
1. Open the `Runner.xcodeproj` in the path: `sample/ios/Runner.xcodeproj` to run the iOS sample application.
2. Open the `android` folder via Android Studio in the `sample` folder to run the Android sample application.


## <a name="plugin-integration"></a> Plugin integration

1. To add the BlinkID plugin to a Flutter project, first create empty project if needed:
```bash
flutter create project_name
```
2. Since the native BlinkID iOS SDK is only distributed via Swift Package Manager, Flutter's Swift Package Manager support also needs to be enabled:
```bash
flutter config --enable-swift-package-manager
```

3. Add the blinkid_flutter dependency to your `pubspec.yaml` file:
```yaml
dependencies:
  ...
  blinkid_flutter:
```

4. Run the command to install the dependency:
```bash
flutter pub get
```

## <a name="plugin-usage"></a> Plugin usage
1. After the dependency has been added to the project, first add the necessary import:
```dart
import 'package:blinkid_flutter/blinkid_flutter.dart';
```
2. Initialize the BlinkID plugin:
```dart
final blinkidPlugin = BlinkIdFlutter();
```
3. Set all of the necessary BlinkID settings (SDK settings, session settings, and the scanning settings). If the mentioned settings are not modified, the default values will be used:
```dart

// Add the license key for each platform
var sdkLicenseKey = "";

if (Platform.isAndroid) {
  sdkLicenseKey = "android-license-key";
} else if (Platform.isIOS) {
  sdkLicenseKey = "ios-license-key";
}

/// Set the BlinkID SDK settings
/// Add the license key here from the code above
final sdkSettings = BlinkIdSdkSettings(sdkLicenseKey);
sdkSettings.downloadResources = true;

/// Create and modify the Session Settings
final sessionSettings = BlinkIdSessionSettings();
sessionSettings.scanningMode = ScanningMode.automatic;

/// Create and modify the scanning settings
final scanningSettings = BlinkIdScanningSettings();
scanningSettings.glareDetectionLevel = DetectionLevel.mid;

/// Create and modify the Image settings
final imageSettings = CroppedImageSettings();
imageSettings.returnDocumentImage = true;
imageSettings.returnSignatureImage = true;
imageSettings.returnFaceImage = true;

/// Place the image settings in the scanning settings
scanningSettings.croppedImageSettings = imageSettings;

/// Create and modify the UI settings. This paramater is optional.
final uiSettings = BlinkIdUiSettings();
uiSettings.showHelpButton = true;
uiSettings.showOnboardingDialog = false;

/// Add the document class filter. This parameter is optional.
final classFilter = ClassFilter.withIncludedDocumentClasses([
    DocumentFilter(Country.canada),
    DocumentFilter(Country.usa, Region.california),
]);
```

4. Call the appropriate scanning method (with the default UX, or DirectAPI for static images), handle the results and catch any errors:
```dart
// Call the performScan method, where the SDK and session settings need to be passed
// Here, you can also pass the optional ClassFilter object from step 3.
await blinkIdPlugin
    .performScan(sdkSettings, sessionSettings, uiSettings) //, classFilter) -> optional 
    .then((blinkidResult) {
      //handle the results here.
      print(blinkidResult.firstName?.value);
    })
    .catchError((scanningError) {
      // handle any errors here.
      if (scanningError is PlatformException) {
        print("BlinkID scanning error: $errorMessage";)
      }
    });
```
- The whole integration process can be found in the sample app `main.dart` file [here](https://github.com/BlinkID/blinkid-flutter/blob/master/sample_files/main.dart).
- The settings and the results that can be used with the BlinkID plugin can be found in the paragraphs below, but also in the comments of each BlinkID Dart file.

## <a name="plugin-specifics"></a> Plugin specifics
The BlinkID plugin implementation is located in the `lib` folder, while platform-specific implementation is located in the `android` and `ios` folders.

### <a name="scanning-methods"></a> Scanning methods
Currently, the BlinkID plugin contains the two main methods of scanning: `performScan` and `performDirectApiScan`.

**The `performScan` method**

The `performScan` method launches the BlinkID scanning process with the default UX properties.\
It takes the following parameters: 
1. BlinkID SDK settings
2. BlinkID session settings
3. The optional BlinkID UI settings
4. The optional ClassFilter object for filtering documents.

**BlinkID SDK Settings** - `BlinkIdSdkSettings`: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK needs for the scanning process, should be obtained.

**BlinkID Session Settings** - `BlinkIdSessionSettings`: the class that contains various settings for the scanning session. It contains the settings for the `ScanningMode` and `BlinkIdScanningSettings`, which define various parameters that control the scanning process.

**BlinkID UI class** - `BlinkIdUiSettings` - the optional class that allows customization of various aspects of the UI used during the scanning process.

The optional **ClassFilter** class - `ClassFilter`: the class which controls which documents will be accepted or reject for information extraction during the scanning session.

- The implementation of the `performScan` method can be viewed here in the [blinkid_flutter_method_channel.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_flutter_method_channel.dart) file.

**The `performDirectApiScan` method**

The `performDirectApiScan` method launches the BlinkID scanning process intended for information extraction from static images.\
It takes the following parameters: 
1. BlinkID SDK settings
2. BlinkID session settings
3. First image string in the Base64 format
4. The optional second image string in the Base64 format

**BlinkID SDK Settings** - `BlinkIdSdkSettings`: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK needs for the scanning process, should be obtained.

**BlinkID Session Settings** - `BlinkIdSessionSettings`: the class that contains various settings for the scanning session. It contains the settings for the `ScanningMode` and `BlinkIdScanningSettings`, which define various parameters that control the scanning process.

The first image Base64 string - `String`: image that represents one side of the document. If the document contains two sides and the `ScanningMode` is set to `automatic`, this should contain the image of the front side of the document. In case the `ScanningMode` is set to `single`, it can be either the front or the back side of the document. If the document contains only one side (for example, various passports), the SDK will automatically detect it, and will not look for the other side.

The optional second image Base64 string - `String`: needed if the information from back side of the document is required and the `ScanningMode` is set to `automatic`.

- The implementation of the `performDirectApiScanning` method can be viewed here in the [blinkid_flutter_method_channel.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_flutter_method_channel.dart) file.

### <a name="blinkid-settings"></a> BlinkID Settings
The BlinkID SDK contains various settings, modifying different parts of scanning process:
1. [BlinkID SDK settings](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_settings.dart#L6) - `BlinkIdSdkSettings` \
These settings are used for the initialization of the BlinkID SDK.

2. [BlinkID session settings](https://github.com/BlinkID/blinkid-flutter/master/BlinkID/lib/blinkid_settings.dart#L66) - `BlinkIdSessionSettings`\
These settings represent the configuration settings for a scanning session.\
This class holds the settings related to the resources initialization, scanning mode, and specific scanning configurations that define how the scanning session should behave.

3. [BlinkID scanning settings](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_settings.dart#L102) - `BlinkIdScanningSettings`\
These settings represent the configurable settings for scanning a document.`
This class defines various parameters and policies related to the scanning process, including image quality handling, data extraction and anonymization, along with options for frame processing and image extraction.

4. [BlinkID UI settings](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_settings.dart#L373) - `BlinkIdUiSettings`\
Allows customization of various aspects of the UI used during the scanning process.

5. [Cropped image settings](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_settings.dart#L336) - `CroppedImageSettings`\
These settings represent the image cropping settings.

**Additional notes:**

- The [blinkid_settings.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_settings.dart) file contains all the settings that can be modified and explains what each setting does in more detail.

- The native documentation for the above mentioned settings can be found here for [Android](https://blinkid.github.io/blinkid-android/blinkid-core/com.microblink.blinkid.core/index.html) & [iOS](https://blinkid.github.io/blinkid-swift-package/documentation/blinkid/).

- The native Kotlin & Swift implementation of all BlinkID settings can be found here for [Android](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/android/src/main/kotlin/com/microblink/blinkid/flutter/BlinkidDeserializationUtils.kt) & [iOS](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/ios/blinkid_flutter/Sources/blinkid_flutter/BlinkidDeserializationUtils.swift) in the BlinkID deserialization utilities.

### <a name="blinkid-result"></a> BlinkID Results

The result of the scanning process is stored in the `BlinkIdScanningResult`. It contains the results of scanning a document, including the extracted data and images from the document.

Along with the information scanned from the document, the BlinkID also provides additional details that was obtained during the scanning process:

1. **Recognition mode**- `RecognitionMode`\
Scanning mode used to scan the current document.

2. **Document class info** - `DocumentClassInfo`\
The document class information.

3. **Data match informatoin** - `DataMatchResult`\
Info on whether the data extracted from multiple sides matches.

4. **Singleside scanning result** - `SingleSideScanningResult`\
Represents the result of scanning a single side of the document.\
Contains the data extracted from the Visual Inspection Zone, Machine Readable Zone, barcode, the input image, and the cropped document, face, and signature images.

5. **Detailed cropped image result** - `DetailedCroppedImageResult`\
Represents the result of the image crop transformation with additional details.

**Additional notes:**

- The [blinkid_result.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_result.dart) file contains all the results that can be obtained and explains what each result represents in more detail.

- The native documentation for the above mentioned results can be found here for [Android](https://blinkid.github.io/blinkid-android/blinkid-core/com.microblink.blinkid.core.session/-blink-id-scanning-result/index.html) & [iOS](https://blinkid.github.io/blinkid-swift-package/documentation/blinkid/blinkidscanningresult).

- The native Kotlin & Swift implementation of all BlinkID results can be found here for [Android](https://github.com/BlinkID/blinkid-flutter/blob/feature/android-platform-channel/BlinkID/android/src/main/kotlin/com/microblink/blinkid/flutter/BlinkidSerializationUtils.kt) & [iOS](https://github.com/BlinkID/blinkid-flutter/blob/feature/ios-platform-channel/BlinkID/ios/blinkid_flutter/Sources/blinkid_flutter/BlinkidSerializationUtils.swift) in the BlinkID serialization utilities.

## <a name="additional-information"></a> Additional information
For any additional questions and information, feel free to contact us [here](https://help.microblink.com), or directly to the Support team via mail support@microblink.com.
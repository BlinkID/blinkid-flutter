# BlinkID SDK Flutter plugin

This repository contains Flutter wrappers for BlinkID native SDKs ([iOS](https://github.com/BlinkID/blinkid-ios)
and [Android](https://github.com/BlinkID/blinkid-android)). Not all features of native SDKs are available. However, the wrapper is open source so you can add features that you need. For 100% of features and maximum control, consider using native SDKs.

## Requirements
BlinkID plugin is developed with Flutter SDK version 1.17.11.
For help with Flutter, view official [documentation](https://flutter.dev/docs).

## Getting Started

To get started, first create empty project if needed:
```shell
flutter create project_name
```

Add the blinkid_flutter dependency to your `pubspec.yaml` file:
```yaml
dependencies:
  ...
  blinkid_flutter:
```

### Quick start with sample app
To try BlinkID plugin, you can generate a minimal sample application. To do so run `./initFlutterDemo.sh` script.

To run sample application, use the following commands:
```shell
cd sample/
flutter run
```
If there are problems with running the application, please make sure you have
properly configured tools by running `flutter doctor`. You can also try running
the application from VSCode, Android Studio or Xcode.

### Plugin usage
1. Perform scanning by calling the method `MicroblinkScanner.scanWithCamera()` and passing it the `RecognizerCollection` and `OverlaySettings` you wish to use, along with your license key. To find out more about licensing, click
 [here](#licensing).
```dart
Future<void> scan() async {
    List<RecognizerResult> results;
    
    Recognizer recognizer = BlinkIdCombinedRecognizer();
    OverlaySettings settings = BlinkIdOverlaySettings();

    // set your license
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "";
    }

    try {
      // perform scan and gather results
      results = await MicroblinkScanner.scanWithCamera(RecognizerCollection([recognizer]), settings, license);

    } on PlatformException {
      // handle exception
    }
```

2. When scanning is completed, variable `results` will contain a list of non-empty `RecognizerResults` from recognizers set in `RecognizerCollection`. You can then access each result individually. If the scanning is manually closed, the method will return an empty list.

For more information please refer to our sample application source code.

### Available API
All available recognizers can be found inside `BlinkID/lib/recognizers`.

All available overlays can be found inside `BlinkID/lib/overlays`.

For 100% of features and maximum control, consider using native SDK.

### Platform specifics
Plugin implementation is in folder `lib`, while platform specific implementations are in `android` and `ios` folders.

#### Android
Android folder is fully initialized after running `./initFlutterDemo.sh`. The script will replace default `MainActivity.java` with the
`./sample_files/MainActivity.java`. This is important, because the plugin works only if `MainActivity` extends `io.flutter.app.FlutterActivity`
and if it is registered in the following way `MicroblinkFlutterPlugin.registerWith(registrarFor("com.microblink.flutter.MicroblinkFlutterPlugin"))`.

#### iOS
To initialize BlinkID framework for use with iOS, after you've added the dependency to `blinkid_flutter` to your `pubspec.yaml`, go to `NameOfYourProject/ios`and run `pod install`.
Our `blinkid_flutter` depends on the latest PPBlinkID pod so it will be installed automatically.

To set camera permission usage message, open `NameOfYourProject/ios/Runner.xcworkspace` and under `Runner/Runner/Info.plist` set
`Privacy - Camera Usage Description`.

## Licensing
- [Generate](https://microblink.com/login?url=/customer/generatedemolicence) a **free trial license key** to start using the SDK in your app (registration required)
- Get information about pricing and licensing of [BlinkID](https://microblink.com/blinkid)

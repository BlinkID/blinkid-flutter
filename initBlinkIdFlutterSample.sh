#!/bin/bash

appName=sample

# remove any existing code
rm -rf $appName

# create a sample application
flutter create --org com.microblink -a kotlin $appName

# enter into demo project folder
pushd $appName

IS_LOCAL_BUILD=true || exit 1
if [ "$IS_LOCAL_BUILD" = true ]; then
  # add blinkid_flutter dependency with local path to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkid_flutter:\n    path: ..\/BlinkID\n  image_picker: 1.0.0/" pubspec.yaml
  echo "Using blinkid_flutter from this repo instead from flutter pub"
else
  # add blinkid_flutter dependency to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkid_flutter:\n  image_picker: 1.0.0/" pubspec.yaml
  echo "Using blinkid_flutter from flutter pub"
fi

flutter pub get

# enter into ios project folder
pushd ios

#Force minimal iOS version
sed -i '' "s/# platform :ios, '12.0'/platform :ios, '16.0'/" Podfile

# go to flutter root project
popd

cp ../sample_files/main.dart lib/
cp ../sample_files/blinkid_result_builder.dart lib/

echo ""
echo "Go to Flutter project folder: cd $appName"
echo "To run on Android type: flutter run"
echo "To run on iOS:
1. Open $appName/ios/Runner.xcworkspace
2. Set your development team
3. Add the NSCameraUsageDescription & NSPhotoLibraryUsageDescription keys to the Runner/Info.plist file
4. Press run"

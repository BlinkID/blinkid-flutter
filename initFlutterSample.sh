#!/bin/bash

appName=sample

# remove any existing code
rm -rf $appName

# create a sample application
flutter create -a java --org com.microblink $appName

# enter into demo project folder
pushd $appName

IS_LOCAL_BUILD=false || exit 1
if [ "$IS_LOCAL_BUILD" = true ]; then
  # add blinkid_flutter dependency with local path to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkid_flutter:\n    path: ..\/BlinkID/" pubspec.yaml
  echo "Using blinkid_flutter from this repo instead from flutter pub"
else
  # add blinkid_flutter dependency to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkid_flutter:/" pubspec.yaml
  echo "Using blinkid_flutter from flutter pub"
fi

#update sdk version to 2.12 to support null safety.
sed -in 's/sdk: ">=[0-9.]*/sdk: ">=2.12.0/' pubspec.yaml

flutter pub get

# enter into android project folder
pushd android

popd

# enter into ios project folder
pushd ios

# install pod
pod install

if false; then
  echo "Replace pod with custom dev version of BlinkID framework"

  pushd Pods/PPBlinkID
  rm -rf Microblink.bundle
  rm -rf Microblink.framework

  cp -r ~/Downloads/blinkid-ios/Microblink.bundle ./
  cp -r ~/Downloads/blinkid-ios/Microblink.framework ./
  popd
fi

# go to flutter root project
popd

cp ../sample_files/main.dart lib/

echo ""
echo "Go to Flutter project folder: cd $appName"
echo "To run on Android type: flutter run"
echo "To run on iOS: go to $appName/ios and open Runner.xcworkspace; set your development team and add Privacy - Camera Usage Description key to Runner/Info.plist file and press run"

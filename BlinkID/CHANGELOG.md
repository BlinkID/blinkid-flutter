## 7.1.0

The version 7 release of the BlinkID SDK.
- Updated to [Android SDK v7.1.0](https://github.com/BlinkID/blinkid-android/releases/tag/v7.1.0) and [iOS SDK v7.1.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v7.1.0)

## Breaking changes
- The plugin now requires:
    - iOS version 16.0 and above.
    - Android API version 24 and above.
    - Flutter version 3.29 and above.

- Class `MicroblinkScanner` has been renamed to `BlinkidFlutter`.
- Method `scanWithCamera` has been renamed to `performScan`.
- Method `scanWithDirectApi` has been renamed to `performDirectApiScan`.

### Version 7 plugin usage
**The `performScan` method**

The `performScan` method launches the BlinkID scanning process with the default UX properties.\
It takes the following parameters: 
1. BlinkID SDK settings
2. BlinkID session settings
3. The optional ClassFilter object for filtering documents.

**BlinkID SDK Settings** - `BlinkIdSdkSettings`: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK needs for the scanning process, should be obtained.

**BlinkID Session Settings** - `BlinkIdSessionSettings`: the class that contains various settings for the scanning session. It contains the settings for the `ScanningMode` and `BlinkIdScanningSettings`, which define various parameters that control the scanning process.

The optional **ClassFilter** class - [ClassFilter]: the class which controls which documents will be accepted or reject for information extraction during the scanning session.

- The implementation of the `performScan` method can be viewed here in the [blinkid_flutter_method_channel.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_flutter_method_channel.dart) file.

**The `performDirectApiScanning` method**

The `performDirectApiScan` method launches the BlinkID scanning process inteded for information extraction from static images.\
It takes the following parameters: 
1. BlinkID SDK settings
2. BlinkID session settings
3. First image string in the Base64 format
4. The optional second image string in the Base64 format

**BlinkID SDK Settings** - `BlinkIdSdkSettings`: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK needs for the scanning process, should be obtained.

**BlinkID Session Settings** - `BlinkIdSessionSettings`: the class that contains various settings for the scanning session. It contains the settings for the [ScanningMode] and [BlinkIdScanningSettings], which define various parameters that control the scanning process.

The first image Base64 string - `String`: image that represents one side of the document. If the document contains two sides and the `ScanningMode` is set to `automatic`, this should contain the image of the front side of the document. In case the `ScanningMode` is set to `single`, it can be either the front or the back side of the document. If the document contains only one side (for example, various passports), the SDK will automatically detect it, and will not look for the other side.

The optional second image Base64 string - `String`: needed if the information from back side of the document is required and the `ScanningMode` is set to `automatic`.

- The implementation of the `performDirectApiScan` method can be viewed here in the [blinkid_flutter_method_channel.dart](https://github.com/BlinkID/blinkid-flutter/blob/master/BlinkID/lib/blinkid_flutter_method_channel.dart) file.

**BlinkID result**

- Both scan returns the `BlinkIdScanningResult` object, which contains the results of scanning a document, including the extracted data and images from the document.

- All of the available results can be viewed [here](https://github.com/BlinkID/blinkid-flutter/blob/feature/dart-types/BlinkID/lib/blinkid_result.dart).

**Implementation guide**
- A detailed guide about the integration and usage of the plugin can be viewed [here](https://github.com/BlinkID/blinkid-flutter/tree/master?tab=readme-ov-file#plugin-integration).

## 6.1.2
- Fixed date and `documentDataMatch` errors

## 6.1.1
- Updated to [Android SDK v6.1.1](https://github.com/BlinkID/blinkid-android/releases/tag/v6.1.1) and [iOS SDK v6.1.2](https://github.com/BlinkID/blinkid-ios/releases/tag/v6.1.2)

## 6.1.0
- Updated to [Android SDK v6.1.0](https://github.com/BlinkID/blinkid-android/releases/tag/v6.1.0) and [iOS SDK v6.1.1](https://github.com/BlinkID/blinkid-ios/releases/tag/v6.1.1)

## 5.8.1
- Fixed `documentDataMatch` serialization.

## 5.8.0
- Updated to [Android SDK v5.8.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.8.0) and [iOS SDK v5.8.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.8.0)

## 5.7.1

### Major bug fix:

- This version fixes bug introduced in v5.7.0 which could cause SDK crash on `applicationDidBecomeActive` event.

## 5.7.0

### Plugin changes
- We changed the way BlinkID plugin is registered in Android so it no longer requires changing MainActivity. This fixes [Issue #2](https://github.com/BlinkID/blinkid-flutter/issues/2) and [Issue #5](https://github.com/BlinkID/blinkid-flutter/issues/5).

### New features
- We translated complete SDK to the following additional languages: **Malay**, **Dutch**, **Hungarian**, **Slovenian**, **Indonesian**, **Arabic(UAE)**, **Romanian**, **Chinese traditional**, **Chinese simplified**, **Thai**, **Hebrew**, **Vietnamese**, **Filipino**.

### Improvements to existing features:

- We have improved parsing of **MRZ** formats deviating from the ISO/IEC 7501 standard:
    - Document discriminator was in place of the document number on driver licenses and IDs from:
        - **New York**
        - **Michigan**
        - **Canada**
    - Different check digit calculation for **Mexico** (Consular) ID
    - Recognition of the unofficial `XCT` country code for Northern **Cyprus** ID
    - Recognition of different country codes and check digit calculation on **China** Mainland Travel Permit for Hong Kong and Macao Residents
- We added **anonymization** support for:
    - MRZ on the Mainland Travel Permit for Hong Kong and Macao Residents
- We have made some changes to the **BlinkID(Combined)Recognizer**
    - You can now see `ProcessingStatus` in the results to inspect potential processing errors, such as when barcode detection fails, a mandatory field is missing, etc.
    - You can now also see a more detailed `ImageAnalysisResult` showing you when:
        - Face image is detected
        - MRZ is detected
        - Barcode is detected
    - We added a `RecognitionModeFilter` settings group. You can toggle flags on this object to control the recognition mode of the recognizer:
        - `enableMrzId` lets you scan MRZ on all identity documents except visas and passports.
        - `enableMrzVisa` lets you scan MRZ on visa documents.
        - `enableMrzPassport` lets you scan MRZ on passports.
        - `enablePhotoId` lets you scan photo IDs. Use it to enable or disable document and face image extraction on unsupported documents.
        - `enableFullRecognition` lets you scan all data from our [supported](https://github.com/BlinkID/blinkid-android/blob/master/documentation/BlinkIDRecognizer.md) documents.
        - Your license key still controls which of the above recognition modes are allowed.
    - We have added a `RecognitionMode` result member describing which recognition mode was used to produce the results.
    -  We are now retrieving sex and nationality fields from the MRZ in cases where those two fields cannot be found in the document’s VIZ. Previously, we only used to do this for dates, name fields and document numbers.
    - We are now preserving the original string (raw data) of the dates we couldn’t parse.
- We have improved the thresholds for card detection feedback messages ("move closer" and "move farther"). This will improve the UX when scanning in landscape mode as the document can now be closer to the camera.

### Minor API Changes
- We have made some changes to the `BlinkIDRecognizer` and `BlinkIDCombinedRecognizer`:
    - We renamed `DocumentImageMoireStatus` to `ImageAnalysisDetectionStatus`
    - We grouped the `conditions` member from the results with the `DriverLicenseDetailedInfo` structure
- We renamed `RecogitionMode` to `RecognitionDebugMode` in `RecognizerBundle`.

### Bug fixes:
- We fixed an issue in default UI that was causing reticle to reappear while card flip animation was showing.

## 5.6.0

### New features:

- We have translated complete SDK to following languages: **Croatian**, **Czech**, **English**, **French**, **German**, **Italian**, **Portuguese**, **Slovak**, and **Spanish**.

- In `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer` we added:
    - Support for US documents with **vertical** orientations:
        - Alabama DL
        - Arizona DL
        - California DL
        - Colorado DL
        - Connecticut DL
        - Georgia DL
        - Illinois DL
        - Iowa DL
        - Kansas DL
        - Kentucky DL
        - Maryland DL
        - Massachusetts DL
        - Minnesota DL
        - Missouri DL
        - New Jersey DL
        - Ohio DL
        - Pennsylvania DL
        - South Carolina DL
        - Tennessee DL
        - Texas DL
        - Utah DL
        - Washington DL
        - Wisconsin DL
    - Support for **new document types**:
        - Croatia Health Insurance Card / front side / BETA
        - Ecuador ID / front side
        - El Salvador ID / BETA
        - Sri Lanka ID / BETA
    - No longer BETA:
        - Canada Nova Scotia DL
        - Canada Yukon DL
        - Norway DL
    - Back side support:
        - Kenya ID
    - **Result anonymization** - with this option enabled, results are not returned for protected fields on certain documents. The full document image will also have this data blacked out.
        - Protected fields are:
         - Document number on Hong Kong ID
         - MRZ on Hong Kong passports
         - Personal ID number on Netherlands DL
         - Personal ID number and MRZ on Netherlands ID
         - MRZ on Netherlands passports
         - Document number on Singapore DL, ID, Fin Card, Resident ID
         - Personal ID number on Singapore Employment Pass
         - Document number and personal ID number on Singapore Work Permit
         - MRZ on Singapore passports
           - By using `anonymizationMode` property, you can choose the `AnonymizationMode`: `ImageOnly`, `ResultFieldsOnly`, `FullResult` or `None`.
        - `FullResult` anonymization (both images and data) is set by default.

- We added support for new **MRZ** formats:
    - Guatemala ID
    - Kenya ID

### Improvements to existing features:

- We updated `UsdlRecognizerResult` and `IdBarcodeRecognizer.Result` with additional address fields:
    - `street`, `postalCode`, `city` and `jurisdiction` 
- We added `expired` (in Swift `isExpired`) property to `BlinkIdRecognizerResult`, `BlinkIdCombinedRecognizerResult` and `IdBarcodeRecognizerResult`.
    - It compares the current time on the device with the date of expiry and checks whether the document has expired or not. 
- We made changes to the result structure of `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer`:
    - Barcode data is now encapsulated in its own result structure: `BarcodeResult`.
    - Data from all OCR-ed fields, without MRZ data, is now encapsulated in a `VizResult` structure, representing the "Visual Inspection Zone" data. In `BlinkIdCombinedRecognizer`, front side data is available in its own structure (`frontVizResult`), back side data in its own (`backVizResult`), so you can now **access data from each side separately**.
    - The main part of the result, outside these structures, is filled according to these rules:
        - Document number is filled with data from the MRZ, if present.
        - Remaining data is then filled with barcode data.
        - Remaining data is filled from the back side's visual inspection zone (OCR data outside of MRZ).
        - Remaining data is filled from the front side's visual inspection zone.
        - Remaining data is filled with data from the MRZ.

### Minor API changes:

- We moved `BlinkIdRecognizerResult` members `colorStatus` and `moireStatus` to the result's `imageAnalysisResult` (`frontImageAnalysisResult` and `backImageAnalysisResult` in `BlinkIDCombinedRecognizerResult`).

### Bug fixes:

- We fixed US driver's license address extraction (Oregon, Mississippi, Rhode Island).
- We removed OpenGL entirely which was causing unexpected crashes.

## 5.5.0+1

Updated README for 5.5.0

## 5.5.0

### New features:

- In `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer` we added:
    - Support for obtaining full document image for IDs with barcodes. Now you can capture document image and extract barcode data with a single scan.
    - Scanning & data extraction for  travel visas and passports.
    - Field validation - we validate if the results from certain fields match predefined character sets.
            - If validation fails, the recognizer's state is `RecognizerResultStateUncertain`.
            - Use `validateResultCharacters`to enable or disable validation.
    - Field anonymization for sensitive data.
            - Enable or disable whether certain sensitive data should be anonymized in full document image result.
            - Use `anonymizeImage` to enable or disable image anonymization.
    
    - Support for new document types:
        - Australia New South Wales - ID Card / Front only / BETA
        - Brazil - Driver License / BETA
        - Brunei - Military ID / BETA
        - Brunei - Residence Permit / BETA
        - Brunei - Temporary Residence Permit / BETA
        - Ghana - Driver License / Front only
        - Latvia - ID Card
        - Norway - Driving Licence / Front only / BETA
        - Oman - ID Card
        - Saudi Arabia - ID Card / BETA
        - Sweden - Social Security Card / Front only
        - USA - Social Security Card / BETA
        - Back side supported:
            - Malaysia - MyTentera

    - No longer BETA:
        - Australia Tasmania - Driving Licence
        - Canada British Columbia - ID Card
        - Germany - Residence Permit
        - Morocco - ID Card
        - Nigeria - Voter ID
        - Singapore - Work Permit
        - USA Alaska - ID Card
        - USA District Of Columbia - Driver License
        - USA Indiana - ID Card
        - USA Kentucky - ID Card
    
    - Barcode scanning on the following documents:
        - Argentina ID
        - Colombia ID
        - Nigeria Voter ID
        - South Africa ID

### Improvements for existing features:

- Improvements in `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer`:
    - Documents discarded with the class filter are now reported as not supported
        -  `onDocumentSupportStatus` will be called if a documents is filtered out by the `classInfoFilter`.
    - For Malaysian MyKad we are now returning if a Moire pattern is present on the scanned document (detected or not detected).
        - use `documentImageMoireStatus` in `BlinkIdRecognizer`.
        - use `documentFrontImageMoireStatus` and `documentBackImageMoireStatus` in `BlinkIdCombinedRecognizer`.
- We added digital signature support to `PassportRecognizer`. 
- We updated `IdBarcodeRecognizerResult` with specific driving license info.
    - Use `restrictions`, `endorsements` and `vehicleClass`

import 'package:json_annotation/json_annotation.dart';

import '../recognizer.dart';
import '../types.dart';

part 'blink_id_multi_side_recognizer.g.dart';

/// Result object for BlinkIdMultiSideRecognizer.
class BlinkIdMultiSideRecognizerResult extends RecognizerResult {
  ///The additional address information of the document owner.
  StringResult? additionalAddressInformation;

  ///The additional name information of the document owner.
  StringResult? additionalNameInformation;

  ///The one more additional address information of the document owner.
  StringResult? additionalOptionalAddressInformation;

  ///The address of the document owner.
  StringResult? address;

  ///The current age of the document owner in years. It is calculated difference
  /// between now and date of birth. Now is current time on the device.
  /// @return current age of the document owner in years or -1 if date of birth is unknown.
  int? age;

  ///Additional info on processing of the back side.
  AdditionalProcessingInfo? backAdditionalProcessingInfo;

  ///The back raw camera frame.
  String? backCameraFrame;

  ///Defines possible color and moire statuses determined from scanned back image.
  ImageAnalysisResult? backImageAnalysisResult;

  ///Status of the last back side recognition process.
  ProcessingStatus? backProcessingStatus;

  ///Defines the data extracted from the back side visual inspection zone.
  VizResult? backVizResult;

  ///The barcode raw camera frame.
  String? barcodeCameraFrame;

  ///Defines the data extracted from the barcode.
  BarcodeResult? barcodeResult;

  ///The classification information.
  ClassInfo? classInfo;

  ///Detailed info on data match.
  DataMatchResult? dataMatch;

  ///The date of birth of the document owner.
  DateResult? dateOfBirth;

  ///The date of expiry of the document.
  DateResult? dateOfExpiry;

  ///Determines if date of expiry is permanent.
  bool? dateOfExpiryPermanent;

  ///The date of issue of the document.
  DateResult? dateOfIssue;

  ///The additional number of the document.
  StringResult? documentAdditionalNumber;

  ///The document number.
  StringResult? documentNumber;

  ///The one more additional number of the document.
  StringResult? documentOptionalAdditionalNumber;

  ///The driver license detailed info.
  DriverLicenseDetailedInfo? driverLicenseDetailedInfo;

  ///The employer of the document owner.
  StringResult? employer;

  ///Checks whether the document has expired or not by comparing the current
  /// time on the device with the date of expiry.
  ///
  /// @return true if the document has expired, false in following cases:
  /// document does not expire (date of expiry is permanent)
  /// date of expiry has passed
  /// date of expiry is unknown and it is not permanent
  bool? expired;

  ///face image from the document if enabled with returnFaceImage property.
  String? faceImage;

  ///face image location from the document if enabled with returnFaceImage property.
  Rectangle? faceImageLocation;

  ///side of document that face image is located on if enabled with returnFaceImage property.
  DocumentSide? faceImageSide;

  ///The father's name of the document owner.
  StringResult? fathersName;

  ///The first name of the document owner.
  StringResult? firstName;

  ///Additional info on processing of the front side.
  AdditionalProcessingInfo? frontAdditionalProcessingInfo;

  ///The front raw camera frame.
  String? frontCameraFrame;

  ///Defines possible color and moire statuses determined from scanned front image.
  ImageAnalysisResult? frontImageAnalysisResult;

  ///Status of the last front side recognition process.
  ProcessingStatus? frontProcessingStatus;

  ///Defines the data extracted from the front side visual inspection zone.
  VizResult? frontVizResult;

  ///back side image of the document if enabled with returnFullDocumentImage property.
  String? fullDocumentBackImage;

  ///front side image of the document if enabled with returnFullDocumentImage property.
  String? fullDocumentFrontImage;

  ///The full name of the document owner.
  StringResult? fullName;

  ///The issuing authority of the document.
  StringResult? issuingAuthority;

  ///The last name of the document owner.
  StringResult? lastName;

  ///The localized name of the document owner.
  StringResult? localizedName;

  ///The marital status of the document owner.
  StringResult? maritalStatus;

  ///The mother's name of the document owner.
  StringResult? mothersName;

  ///The data extracted from the machine readable zone
  MrzResult? mrzResult;

  ///The nationality of the documet owner.
  StringResult? nationality;

  ///The personal identification number.
  StringResult? personalIdNumber;

  ///The place of birth of the document owner.
  StringResult? placeOfBirth;

  ///Defines status of the last recognition process.
  ProcessingStatus? processingStatus;

  ///The profession of the document owner.
  StringResult? profession;

  ///The race of the document owner.
  StringResult? race;

  ///Recognition mode used to scan current document.
  RecognitionMode? recognitionMode;

  ///The religion of the document owner.
  StringResult? religion;

  ///The residential stauts of the document owner.
  StringResult? residentialStatus;

  ///Returns true if recognizer has finished scanning first side and is now scanning back side,
  /// false if it's still scanning first side.
  bool? scanningFirstSideDone;

  ///The sex of the document owner.
  StringResult? sex;

  ///image of the signature if enabled with returnSignatureImage property.
  String? signatureImage;

  BlinkIdMultiSideRecognizerResult(Map<String, dynamic> nativeResult)
      : super(RecognizerResultState.values[nativeResult['resultState']], nativeResult: nativeResult) {
    this.nativeResult = nativeResult;
    this.additionalAddressInformation = nativeResult["additionalAddressInformation"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["additionalAddressInformation"]))
        : null;

    this.additionalNameInformation = nativeResult["additionalNameInformation"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["additionalNameInformation"]))
        : null;

    this.additionalOptionalAddressInformation = nativeResult["additionalOptionalAddressInformation"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["additionalOptionalAddressInformation"]))
        : null;

    this.address =
        nativeResult["address"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["address"])) : null;

    this.age = nativeResult["age"];

    this.backAdditionalProcessingInfo = nativeResult["backAdditionalProcessingInfo"] != null
        ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["backAdditionalProcessingInfo"]))
        : null;

    this.backCameraFrame = nativeResult["backCameraFrame"];

    this.backImageAnalysisResult = nativeResult["backImageAnalysisResult"] != null
        ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["backImageAnalysisResult"]))
        : null;

    this.backProcessingStatus = ProcessingStatus.values[nativeResult["backProcessingStatus"]];

    this.backVizResult = nativeResult["backVizResult"] != null
        ? VizResult(Map<String, dynamic>.from(nativeResult["backVizResult"]))
        : null;

    this.barcodeCameraFrame = nativeResult["barcodeCameraFrame"];

    this.barcodeResult = nativeResult["barcodeResult"] != null
        ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"]))
        : null;

    this.classInfo =
        nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;

    this.dataMatch = nativeResult["dataMatch"] != null
        ? DataMatchResult(Map<String, dynamic>.from(nativeResult["dataMatch"]))
        : null;

    this.dateOfBirth =
        nativeResult["dateOfBirth"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;

    this.dateOfExpiry = nativeResult["dateOfExpiry"] != null
        ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfExpiry"]))
        : null;

    this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];

    this.dateOfIssue =
        nativeResult["dateOfIssue"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;

    this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["documentAdditionalNumber"]))
        : null;

    this.documentNumber = nativeResult["documentNumber"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["documentNumber"]))
        : null;

    this.documentOptionalAdditionalNumber = nativeResult["documentOptionalAdditionalNumber"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["documentOptionalAdditionalNumber"]))
        : null;

    this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null
        ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"]))
        : null;

    this.employer =
        nativeResult["employer"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["employer"])) : null;

    this.expired = nativeResult["expired"];

    this.faceImage = nativeResult["faceImage"];

    this.faceImageLocation = nativeResult["faceImageLocation"] != null
        ? Rectangle(Map<String, dynamic>.from(nativeResult["faceImageLocation"]))
        : null;

    this.faceImageSide = DocumentSide.values[nativeResult["faceImageSide"]];

    this.fathersName = nativeResult["fathersName"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["fathersName"]))
        : null;

    this.firstName =
        nativeResult["firstName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["firstName"])) : null;

    this.frontAdditionalProcessingInfo = nativeResult["frontAdditionalProcessingInfo"] != null
        ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["frontAdditionalProcessingInfo"]))
        : null;

    this.frontCameraFrame = nativeResult["frontCameraFrame"];

    this.frontImageAnalysisResult = nativeResult["frontImageAnalysisResult"] != null
        ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["frontImageAnalysisResult"]))
        : null;

    this.frontProcessingStatus = ProcessingStatus.values[nativeResult["frontProcessingStatus"]];

    this.frontVizResult = nativeResult["frontVizResult"] != null
        ? VizResult(Map<String, dynamic>.from(nativeResult["frontVizResult"]))
        : null;

    this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];

    this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];

    this.fullName =
        nativeResult["fullName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fullName"])) : null;

    this.issuingAuthority = nativeResult["issuingAuthority"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["issuingAuthority"]))
        : null;

    this.lastName =
        nativeResult["lastName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["lastName"])) : null;

    this.localizedName = nativeResult["localizedName"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["localizedName"]))
        : null;

    this.maritalStatus = nativeResult["maritalStatus"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["maritalStatus"]))
        : null;

    this.mothersName = nativeResult["mothersName"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["mothersName"]))
        : null;

    this.mrzResult =
        nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;

    this.nationality = nativeResult["nationality"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["nationality"]))
        : null;

    this.personalIdNumber = nativeResult["personalIdNumber"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["personalIdNumber"]))
        : null;

    this.placeOfBirth = nativeResult["placeOfBirth"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["placeOfBirth"]))
        : null;

    this.processingStatus = ProcessingStatus.values[nativeResult["processingStatus"]];

    this.profession =
        nativeResult["profession"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["profession"])) : null;

    this.race = nativeResult["race"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["race"])) : null;

    this.recognitionMode = RecognitionMode.values[nativeResult["recognitionMode"]];

    this.religion =
        nativeResult["religion"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["religion"])) : null;

    this.residentialStatus = nativeResult["residentialStatus"] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult["residentialStatus"]))
        : null;

    this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];

    this.sex = nativeResult["sex"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["sex"])) : null;

    this.signatureImage = nativeResult["signatureImage"];
  }
}

///Recognizer which can scan front and back side of the United States driver license.
@JsonSerializable()
class BlinkIdMultiSideRecognizer extends Recognizer {
  ///Additional anonymization settings.

  List<ClassAnonymizationSettings> additionalAnonymization = [];

  ///Defines whether blured frames filtering is allowed
  ///
  ///

  bool allowBlurFilter = true;

  ///Proceed with scanning the back side even if the front side result is uncertain.
  /// This only works for still images - video feeds will ignore this setting.
  ///
  ///

  bool allowUncertainFrontSideScan = false;

  ///Defines whether returning of unparsed MRZ (Machine Readable Zone) results is allowed
  ///
  ///

  bool allowUnparsedMrzResults = false;

  ///Defines whether returning unverified MRZ (Machine Readable Zone) results is allowed
  /// Unverified MRZ is parsed, but check digits are incorrect
  ///
  ///

  bool allowUnverifiedMrzResults = true;

  ///Defines whether sensitive data should be removed from images, result fields or both.
  /// The setting only applies to certain documents
  ///
  ///

  AnonymizationMode anonymizationMode = AnonymizationMode.FullResult;

  ///Property for setting DPI for face images
  /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
  ///
  ///

  int faceImageDpi = 250;

  ///Property for setting DPI for full document images
  /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
  ///
  ///

  int fullDocumentImageDpi = 250;

  ///Image extension factors for full document image.
  ///
  /// @see ImageExtensionFactors
  ///

  ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();

  ///Configure the number of characters per field that are allowed to be inconsistent in data match.
  ///
  ///

  int maxAllowedMismatchesPerField = 0;

  ///Pading is a minimum distance from the edge of the frame and is defined as a percentage of the frame width. Default value is 0.0f and in that case
  /// padding edge and image edge are the same.
  /// Recommended value is 0.02f.
  ///
  ///

  double paddingEdge = 0.0;

  ///Enable or disable recognition of specific document groups supported by the current license.
  ///
  ///

  RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();

  ///Sets whether face image from ID card should be extracted
  ///
  ///

  bool returnFaceImage = false;

  ///Sets whether full document image of ID card should be extracted.
  ///
  ///

  bool returnFullDocumentImage = false;

  ///Sets whether signature image from ID card should be extracted.
  ///
  ///

  bool returnSignatureImage = false;

  ///Configure the recognizer to save the raw camera frames.
  /// This significantly increases memory consumption.
  ///
  ///

  bool saveCameraFrames = false;

  ///Configure the recognizer to only work on already cropped and dewarped images.
  /// This only works for still images - video feeds will ignore this setting.
  ///
  ///

  bool scanCroppedDocumentImage = false;

  ///Property for setting DPI for signature images
  /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
  ///
  ///

  int signatureImageDpi = 250;

  ///Skip back side capture and processing step when back side of the document is not supported
  ///
  ///

  bool skipUnsupportedBack = false;

  ///Defines whether result characters validatation is performed.
  /// If a result member contains invalid character, the result state cannot be valid
  ///
  ///

  bool validateResultCharacters = true;

  BlinkIdMultiSideRecognizer() : super('BlinkIdMultiSideRecognizer');

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
    return BlinkIdMultiSideRecognizerResult(nativeResult);
  }

  factory BlinkIdMultiSideRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdMultiSideRecognizerFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdMultiSideRecognizerToJson(this);
}

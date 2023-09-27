import 'package:blinkid_flutter/recognizer.dart';
import 'package:blinkid_flutter/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usdl_combined_recognizer.g.dart';

/// Result object for UsdlCombinedRecognizer.
class UsdlCombinedRecognizerResult extends RecognizerResult {
  UsdlCombinedRecognizerResult(Map<String, dynamic> nativeResult)
      : super(RecognizerResultState.values[nativeResult['resultState']]) {
    documentDataMatch = DataMatchState.values[nativeResult['documentDataMatch']];

    faceImage = nativeResult['faceImage'];

    fullDocumentImage = nativeResult['fullDocumentImage'];

    scanningFirstSideDone = nativeResult['scanningFirstSideDone'];

    optionalElements =
        nativeResult['optionalElements'] != null ? List<String>.from(nativeResult['optionalElements']) : null;

    rawData = nativeResult['rawData'];

    rawStringData = nativeResult['rawStringData'];

    uncertain = nativeResult['uncertain'];

    fields = nativeResult['fields'] != null ? List<String>.from(nativeResult['fields']) : null;

    firstName = nativeResult['firstName'];

    middleName = nativeResult['middleName'];

    lastName = nativeResult['lastName'];

    fullName = nativeResult['fullName'];

    nameSuffix = nativeResult['nameSuffix'];

    address = nativeResult['address'];

    documentNumber = nativeResult['documentNumber'];

    sex = nativeResult['sex'];

    restrictions = nativeResult['restrictions'];

    endorsements = nativeResult['endorsements'];

    vehicleClass = nativeResult['vehicleClass'];

    dateOfBirth = nativeResult['dateOfBirth'] != null ? Date(nativeResult['dateOfBirth']) : null;

    dateOfIssue = nativeResult['dateOfIssue'] != null ? Date(nativeResult['dateOfIssue']) : null;

    dateOfExpiry = nativeResult['dateOfExpiry'] != null ? Date(nativeResult['dateOfExpiry']) : null;

    age = nativeResult['age'];
  }

  /// Returns true if data from scanned parts/sides of the document match,
  /// false otherwise. For example if date of expiry is scanned from the front and back side
  /// of the document and values do not match, this method will return false. Result will
  /// be true only if scanned values for all fields that are compared are the same.
  DataMatchState? documentDataMatch;

  /// face image from the document if enabled with returnFaceImage property.
  String? faceImage;

  /// full document image if enabled with returnFullDocumentImage property.
  String? fullDocumentImage;

  /// Returns true if recognizer has finished scanning first side and is now scanning back side,
  /// false if it's still scanning first side.
  bool? scanningFirstSideDone;

  /// Array of elements that are not part of AAMVA standard and are specific to each US state.
  List<String>? optionalElements;

  /// The raw bytes contained inside 2D barcode.
  String? rawData;

  /// Raw string inside 2D barcode.
  String? rawStringData;

  /// True if returned result is uncertain, i.e. if scanned barcode was incomplete (i.e.
  bool? uncertain;

  /// Fields inside US Driver's licence. Available Keys are listed in UsdlKeys enum.
  List<String>? fields;

  /// The first name of the United States driver license owner.
  String? firstName;

  /// The middle name of the United States driver license owner.
  String? middleName;

  /// The last name of the United States driver license owner.
  String? lastName;

  /// The full name of the United States driver license owner.
  String? fullName;

  /// The name suffix of the United States driver license owner.
  String? nameSuffix;

  /// The full address of the United States driver license owner.
  String? address;

  /// The document number of the United States driver license.
  String? documentNumber;

  /// The sex of the United States driver license owner.
  String? sex;

  /// The restrictions to driving privileges for the United States driver license owner.
  String? restrictions;

  /// The additional privileges granted to the United States driver license owner.
  String? endorsements;

  /// The type of vehicle the driver license owner has privilege to drive.
  String? vehicleClass;

  /// The date of birth of the United States driver license owner.
  Date? dateOfBirth;

  /// The date of issue of the United States driver license.
  Date? dateOfIssue;

  /// The date of expiry of the United States driver license.
  Date? dateOfExpiry;

  /// The current age of the document owner in years. It is calculated difference
  /// between now and date of birth. Now is current time on the device.
  /// @return current age of the document owner in years or -1 if date of birth is unknown.
  int? age;
}

///USDL Combined Recognizer.
///
///USDL Combined recognizer is used for scanning both front and back side of US Driver's License.
@JsonSerializable()
class UsdlCombinedRecognizer extends Recognizer {
  UsdlCombinedRecognizer() : super('UsdlCombinedRecognizer');

  factory UsdlCombinedRecognizer.fromJson(Map<String, dynamic> json) => _$UsdlCombinedRecognizerFromJson(json);

  /// Property for setting DPI for face images
  /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
  int faceImageDpi = 250;

  /// Property for setting DPI for full document images
  /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
  int fullDocumentImageDpi = 250;

  /// Sets whether face image from ID card should be extracted
  bool returnFaceImage = false;

  /// Sets whether full document image of ID card should be extracted.
  bool returnFullDocumentImage = false;

  /// The extension factors for full document image.
  ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();

  /// Minimum number of stable detections required for detection to be successful.
  int numStableDetectionsThreshold = 6;

  @override
  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) =>
      UsdlCombinedRecognizerResult(nativeResult);
  @override
  Map<String, dynamic> toJson() => _$UsdlCombinedRecognizerToJson(this);
}

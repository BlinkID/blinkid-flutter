import 'package:json_annotation/json_annotation.dart';

import '../recognizer.dart';
import '../types.dart';

part 'id_barcode_recognizer.g.dart';

/// Result object for IdBarcodeRecognizer.
class IdBarcodeRecognizerResult extends RecognizerResult {
  ///The additional name information of the document owner.
  String? additionalNameInformation;

  ///The address of the document owner.
  String? address;

  ///The current age of the document owner in years. It is calculated difference
  /// between now and date of birth. Now is current time on the device.
  /// @return current age of the document owner in years or -1 if date of birth is unknown.
  int? age;

  ///Type of the barcode scanned
  ///
  ///  @return Type of the barcode
  BarcodeType? barcodeType;

  ///The city address portion of the document owner.
  String? city;

  ///The date of birth of the document owner.
  Date? dateOfBirth;

  ///The date of expiry of the document.
  Date? dateOfExpiry;

  ///The date of issue of the document.
  Date? dateOfIssue;

  ///The additional number of the document.
  String? documentAdditionalNumber;

  ///The document number.
  String? documentNumber;

  ///The document type deduced from the recognized barcode
  ///
  ///  @return Type of the document
  IdBarcodeDocumentType? documentType;

  ///The employer of the document owner.
  String? employer;

  ///The additional privileges granted to the driver license owner.
  String? endorsements;

  ///Checks whether the document has expired or not by comparing the current
  /// time on the device with the date of expiry.
  ///
  /// @return true if the document has expired, false in following cases:
  /// document does not expire (date of expiry is permanent)
  /// date of expiry has passed
  /// date of expiry is unknown and it is not permanent
  bool? expired;

  ///Document specific extended elements that contain all barcode fields in their original form.
  ///
  /// Currently this is only filled for AAMVACompliant documents.
  BarcodeElements? extendedElements;

  ///The first name of the document owner.
  String? firstName;

  ///The full name of the document owner.
  String? fullName;

  ///The issuing authority of the document.
  String? issuingAuthority;

  ///The jurisdiction code address portion of the document owner.
  String? jurisdiction;

  ///The last name of the document owner.
  String? lastName;

  ///The marital status of the document owner.
  String? maritalStatus;

  ///The middle name of the document owner.
  String? middleName;

  ///The nationality of the documet owner.
  String? nationality;

  ///The personal identification number.
  String? personalIdNumber;

  ///The place of birth of the document owner.
  String? placeOfBirth;

  ///The postal code address portion of the document owner.
  String? postalCode;

  ///The profession of the document owner.
  String? profession;

  ///The race of the document owner.
  String? race;

  ///Byte array with result of the scan
  String? rawData;

  ///The religion of the document owner.
  String? religion;

  ///The residential stauts of the document owner.
  String? residentialStatus;

  ///The restrictions to driving privileges for the driver license owner.
  String? restrictions;

  ///The sex of the document owner.
  String? sex;

  ///The street address portion of the document owner.
  String? street;

  ///Retrieves string content of scanned data
  String? stringData;

  ///Flag indicating uncertain scanning data
  /// E.g obtained from damaged barcode.
  bool? uncertain;

  ///The type of vehicle the driver license owner has privilege to drive.
  String? vehicleClass;

  IdBarcodeRecognizerResult(Map<String, dynamic> nativeResult)
      : super(RecognizerResultState.values[nativeResult['resultState']], nativeResult: nativeResult) {
    this.additionalNameInformation = nativeResult["additionalNameInformation"];

    this.address = nativeResult["address"];

    this.age = nativeResult["age"];

    this.barcodeType = BarcodeType.values[nativeResult["barcodeType"]];

    this.city = nativeResult["city"];

    this.dateOfBirth =
        nativeResult["dateOfBirth"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;

    this.dateOfExpiry =
        nativeResult["dateOfExpiry"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;

    this.dateOfIssue =
        nativeResult["dateOfIssue"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;

    this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"];

    this.documentNumber = nativeResult["documentNumber"];

    this.documentType = IdBarcodeDocumentType.values[nativeResult["documentType"]];

    this.employer = nativeResult["employer"];

    this.endorsements = nativeResult["endorsements"];

    this.expired = nativeResult["expired"];

    this.extendedElements = nativeResult["extendedElements"];

    this.firstName = nativeResult["firstName"];

    this.fullName = nativeResult["fullName"];

    this.issuingAuthority = nativeResult["issuingAuthority"];

    this.jurisdiction = nativeResult["jurisdiction"];

    this.lastName = nativeResult["lastName"];

    this.maritalStatus = nativeResult["maritalStatus"];

    this.middleName = nativeResult["middleName"];

    this.nationality = nativeResult["nationality"];

    this.personalIdNumber = nativeResult["personalIdNumber"];

    this.placeOfBirth = nativeResult["placeOfBirth"];

    this.postalCode = nativeResult["postalCode"];

    this.profession = nativeResult["profession"];

    this.race = nativeResult["race"];

    this.rawData = nativeResult["rawData"];

    this.religion = nativeResult["religion"];

    this.residentialStatus = nativeResult["residentialStatus"];

    this.restrictions = nativeResult["restrictions"];

    this.sex = nativeResult["sex"];

    this.street = nativeResult["street"];

    this.stringData = nativeResult["stringData"];

    this.uncertain = nativeResult["uncertain"];

    this.vehicleClass = nativeResult["vehicleClass"];
  }
}

///The ID Barcode Recognizer is used for scanning ID Barcode.
@JsonSerializable()
class IdBarcodeRecognizer extends Recognizer {
  IdBarcodeRecognizer() : super('IdBarcodeRecognizer');

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
    return IdBarcodeRecognizerResult(nativeResult);
  }

  factory IdBarcodeRecognizer.fromJson(Map<String, dynamic> json) => _$IdBarcodeRecognizerFromJson(json);
  Map<String, dynamic> toJson() => _$IdBarcodeRecognizerToJson(this);
}

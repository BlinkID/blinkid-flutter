import 'package:blinkid_flutter/recognizer.dart';
import 'package:blinkid_flutter/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_multi_side_recognizer.g.dart';

/// Result object for BlinkIdMultiSideRecognizer.
class BlinkIdMultiSideRecognizerResult extends RecognizerResult {
  BlinkIdMultiSideRecognizerResult(Map<String, dynamic> nativeResult)
      : super(RecognizerResultState.values[nativeResult['resultState']]) {
    additionalAddressInformation = nativeResult['additionalAddressInformation'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['additionalAddressInformation']))
        : null;

    additionalNameInformation = nativeResult['additionalNameInformation'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['additionalNameInformation']))
        : null;

    additionalOptionalAddressInformation = nativeResult['additionalOptionalAddressInformation'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['additionalOptionalAddressInformation']))
        : null;

    address = nativeResult['address'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['address'])) : null;

    age = nativeResult['age'];

    backAdditionalProcessingInfo = nativeResult['backAdditionalProcessingInfo'] != null
        ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult['backAdditionalProcessingInfo']))
        : null;

    backCameraFrame = nativeResult['backCameraFrame'];

    backImageAnalysisResult = nativeResult['backImageAnalysisResult'] != null
        ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult['backImageAnalysisResult']))
        : null;

    backProcessingStatus = ProcessingStatus.values[nativeResult['backProcessingStatus']];

    backVizResult = nativeResult['backVizResult'] != null
        ? VizResult(Map<String, dynamic>.from(nativeResult['backVizResult']))
        : null;

    barcodeCameraFrame = nativeResult['barcodeCameraFrame'];

    barcodeResult = nativeResult['barcodeResult'] != null
        ? BarcodeResult(Map<String, dynamic>.from(nativeResult['barcodeResult']))
        : null;

    classInfo =
        nativeResult['classInfo'] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult['classInfo'])) : null;

    dataMatchResult = nativeResult['dataMatchResult'] != null
        ? DataMatchResult(Map<String, dynamic>.from(nativeResult['dataMatchResult']))
        : null;

    dateOfBirth =
        nativeResult['dateOfBirth'] != null ? DateResult(Map<String, dynamic>.from(nativeResult['dateOfBirth'])) : null;

    dateOfExpiry = nativeResult['dateOfExpiry'] != null
        ? DateResult(Map<String, dynamic>.from(nativeResult['dateOfExpiry']))
        : null;

    dateOfExpiryPermanent = nativeResult['dateOfExpiryPermanent'];

    dateOfIssue =
        nativeResult['dateOfIssue'] != null ? DateResult(Map<String, dynamic>.from(nativeResult['dateOfIssue'])) : null;

    documentAdditionalNumber = nativeResult['documentAdditionalNumber'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['documentAdditionalNumber']))
        : null;

    documentNumber = nativeResult['documentNumber'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['documentNumber']))
        : null;

    documentOptionalAdditionalNumber = nativeResult['documentOptionalAdditionalNumber'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['documentOptionalAdditionalNumber']))
        : null;

    driverLicenseDetailedInfo = nativeResult['driverLicenseDetailedInfo'] != null
        ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult['driverLicenseDetailedInfo']))
        : null;

    employer =
        nativeResult['employer'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['employer'])) : null;

    expired = nativeResult['expired'];

    faceImage = nativeResult['faceImage'];

    fathersName = nativeResult['fathersName'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['fathersName']))
        : null;

    firstName =
        nativeResult['firstName'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['firstName'])) : null;

    frontAdditionalProcessingInfo = nativeResult['frontAdditionalProcessingInfo'] != null
        ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult['frontAdditionalProcessingInfo']))
        : null;

    frontCameraFrame = nativeResult['frontCameraFrame'];

    frontCameraFrame = nativeResult['frontCameraFrame'];

    frontImageAnalysisResult = nativeResult['frontImageAnalysisResult'] != null
        ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult['frontImageAnalysisResult']))
        : null;

    frontProcessingStatus = ProcessingStatus.values[nativeResult['frontProcessingStatus']];

    frontVizResult = nativeResult['frontVizResult'] != null
        ? VizResult(Map<String, dynamic>.from(nativeResult['frontVizResult']))
        : null;

    fullDocumentBackImage = nativeResult['fullDocumentBackImage'];

    fullDocumentFrontImage = nativeResult['fullDocumentFrontImage'];

    fullName =
        nativeResult['fullName'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['fullName'])) : null;

    issuingAuthority = nativeResult['issuingAuthority'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['issuingAuthority']))
        : null;

    lastName =
        nativeResult['lastName'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['lastName'])) : null;

    localizedName = nativeResult['localizedName'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['localizedName']))
        : null;

    maritalStatus = nativeResult['maritalStatus'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['maritalStatus']))
        : null;

    mothersName = nativeResult['mothersName'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['mothersName']))
        : null;

    mrzResult =
        nativeResult['mrzResult'] != null ? MrzResult(Map<String, dynamic>.from(nativeResult['mrzResult'])) : null;

    final alpha2Code = _nationalityToCountryMap[nationality];
    if (alpha2Code == null) {
      // At this stage nationality is either unknown, or contains some
      // random value from OCR (e.g. a country name).
      // Best we can do is to check MRZ result.
      final mrzNationality = mrzResult?.nationality;
      if (mrzNationality == null) {
        nationalityIsoAlpha2 = null;
      } else if (mrzNationality.length == 3) {
        nationalityIsoAlpha2 = _3to2[mrzNationality.toUpperCase()];
      } else if (mrzNationality.length == 2) {
        nationalityIsoAlpha2 = mrzNationality.toUpperCase();
      }
    } else {
      nationalityIsoAlpha2 = alpha2Code;
    }

    nationality = nativeResult['nationality'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['nationality']))
        : null;

    personalIdNumber = nativeResult['personalIdNumber'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['personalIdNumber']))
        : null;

    placeOfBirth = nativeResult['placeOfBirth'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['placeOfBirth']))
        : null;

    processingStatus = ProcessingStatus.values[nativeResult['processingStatus']];

    profession =
        nativeResult['profession'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['profession'])) : null;

    race = nativeResult['race'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['race'])) : null;

    recognitionMode = RecognitionMode.values[nativeResult['recognitionMode']];

    religion =
        nativeResult['religion'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['religion'])) : null;

    residentialStatus = nativeResult['residentialStatus'] != null
        ? StringResult(Map<String, dynamic>.from(nativeResult['residentialStatus']))
        : null;

    scanningFirstSideDone = nativeResult['scanningFirstSideDone'];

    sex = nativeResult['sex'] != null ? StringResult(Map<String, dynamic>.from(nativeResult['sex'])) : null;

    signatureImage = nativeResult['signatureImage'];

    version = nativeResult['version'];
  }

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

  DataMatchResult? dataMatchResult;

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

  /// ISO 3166 Alpha-2 country code that corresponds to the
  /// [nationality], i.e. a 2-letter country code (e.g. 'CZ').
  ///
  /// This is not an official solution. [BlinkIdCombinedRecognizerResult] as
  /// defined by blinkid doesn't offer nationality of the document holder in a
  /// 2-letter code. Instead, it offers nationality that is spelled in full,
  /// e.g. "RUSSIAN", or "CZECH". This is a quick solution to use before
  /// Microblink implements it properly.
  ///
  /// The value is derived from [nationality] empirically and it may happen
  /// that the value is null, while [nationality] is not.
  ///
  /// It may happen that [nationality] is not indeed a nationality, but
  /// a value of a field "nationality" on a physical document (that is
  /// recognized via OCR). Some countries put just a country name there,
  /// e.g. RUSSIAN FEDERATION. In this case, or in case value of [nationality]
  /// doesn't yield any result, [mrzResult.nationality] is
  /// tried instead and is converted to 2-letter code value, if it is
  /// a 3-letter code one.
  String? nationalityIsoAlpha2;

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

  String? nativeJson;

  ///The version of result.
  int? version;
}

///Recognizer which can scan front and back side of the United States driver license.
@JsonSerializable()
class BlinkIdMultiSideRecognizer extends Recognizer {
  BlinkIdMultiSideRecognizer() : super('BlinkIdMultiSideRecognizer');

  factory BlinkIdMultiSideRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdMultiSideRecognizerFromJson(json);

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

  @override
  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) =>
      BlinkIdMultiSideRecognizerResult(nativeResult);
  @override
  Map<String, dynamic> toJson() => _$BlinkIdMultiSideRecognizerToJson(this);
}

// Nationalities have been found by searching plaintext Strings in a binary
// shared object file blinkid/blinkid-c-sdk/lib/android/x86/libRecognizerApi.so.
// Mapping to country codes have been done manually.
//
// Some nationalities point to the same country:
// China (CN): CHINESE, HANZI
// Curaçao (CW): CURACAO, CURAÇAO, CURAÇAOAN
// Eswatini (SZ): ESWATINI, SWAZI
//
// Amount of nationalities in this map:                                 193
// Amount of countries defined by Mews:                                 250
// Amount of countries that don't get pointed to by any nationality:    61
// AS,American Samoa
// AG,Antigua and Barbuda
// BQ,Bonaire, Sint Eustatius and Saba
// BV,Bouvet Island
// IO,British Indian Ocean Territory
// CV,Cabo Verde
// CF,Central African Republic
// CX,Christmas Island
// CC,Cocos (Keeling) Islands
// CD,Congo (Democratic Republic of the)
// CK,Cook Islands
// CR,Costa Rica
// DM,Dominica
// GQ,Equatorial Guinea
// FK,Falkland Islands (Malvinas)
// FO,Faroe Islands
// GF,French Guiana
// PF,French Polynesia
// TF,French Southern Territories
// GI,Gibraltar
// GG,Guernsey
// GW,Guinea-Bissau
// HM,Heard Island and McDonald Islands
// VA,Holy See
// HK,Hong Kong
// IR,Iran (Islamic Republic of)
// JE,Jersey
// KI,Kiribati
// KP,Korea (Democratic People's Republic of)
// KR,Korea (Republic of)
// LA,Lao People's Democratic Republic
// LV,Latvia
// LU,Luxembourg
// ML,Mali
// NC,New Caledonia
// NZ,New Zealand
// NF,Norfolk Island
// MP,Northern Mariana Islands
// PH,Philippines
// PR,Puerto Rico
// SH,Saint Helena, Ascension and Tristan da Cunha
// KN,Saint Kitts and Nevis
// LC,Saint Lucia
// MF,Saint Martin (Collectivity of France)
// PM,Saint Pierre and Miquelon
// VC,Saint Vincent and the Grenadines
// ST,Sao Tome and Principe
// SA,Saudi Arabia
// SL,Sierra Leone
// SX,Sint Maarten (Dutch Constituency)
// SB,Solomon Islands
// ZA,South Africa
// GS,South Georgia and the South Sandwich Islands
// SS,South Sudan
// LK,Sri Lanka
// SJ,Svalbard and Jan Mayen
// TC,Turks and Caicos Islands
// UM,United States Minor Outlying Islands
// VG,Virgin Islands (British)
// VI,Virgin Islands (U.S.)
// WF,Wallis and Futuna
//
// There are multiple reasons why the above countries are not present in
// this map: their corresponding nationalities were not found in the binary
// file, some of the countries are not sovereign states.
//
// If you get some nationality that is not present in this map, feel free
// to add it.
const _nationalityToCountryMap = {
  'AFGHAN': 'AF',
  'ALANDIC': 'AX',
  'ALBANIAN': 'AL',
  'ALGERIAN': 'DZ',
  'AMERICAN': 'US',
  'ANDORRAN': 'AD',
  'ANGOLAN': 'AO',
  'ANGUILLIAN': 'AI',
  'ANTARCTIC': 'AQ',
  'ARGENTINIAN': 'AR',
  'ARMENIAN': 'AM',
  'ARUBAN': 'AW',
  'AUSTRALIAN': 'AU',
  'AUSTRIAN': 'AT',
  'AZERBAIJANI': 'AZ',
  'BAHAMIAN': 'BS',
  'BAHRAINI': 'BH',
  'BANGLADESHI': 'BD',
  'BARBADIAN': 'BB',
  'BARTHÉLEMOIS': 'BL',
  'BASOTHO': 'LS',
  'BATSWANA': 'BW',
  'BELARUSIAN': 'BY',
  'BELGIAN': 'BE',
  'BELIZEAN': 'BZ',
  'BENINESE': 'BJ',
  'BERMUDIAN': 'BM',
  'BHUTANESE': 'BT',
  'BOLIVIAN': 'BO',
  'BOSNIAN': 'BA',
  'BRAZILIAN': 'BR',
  'BRITISH': 'GB',
  'BRUNEIAN': 'BN',
  'BULGARIAN': 'BG',
  'BURKINABÉ': 'BF',
  'BURMESE': 'MM',
  'BURUNDIAN': 'BI',
  'CAMBODIAN': 'KH',
  'CAMEROONIAN': 'CM',
  'CANADIAN': 'CA',
  'CAYMANIAN': 'KY',
  'CHADIAN': 'TD',
  'CHILEAN': 'CL',
  'CHINESE': 'CN',
  'COLOMBIAN': 'CO',
  'COMORIAN': 'KM',
  'CONGOLESE': 'CG',
  'CROATIAN': 'HR',
  'CUBAN': 'CU',
  'CURACAO': 'CW',
  'CURAÇAO': 'CW',
  'CURAÇAOAN': 'CW',
  'CYPRIOT': 'CY',
  'CZECH': 'CZ',
  'DANISH': 'DK',
  'DEUTSCH': 'DE',
  'DJIBOUTIAN': 'DJ',
  'DOMINICAN': 'DO',
  'DUTCH': 'NL',
  'ECUADORIAN': 'EC',
  'EGYPTIAN': 'EG',
  'EMIRATI': 'AE',
  'ERITREAN': 'ER',
  'ESTONIAN': 'EE',
  'ESWATINI': 'SZ',
  'ETHIOPIAN': 'ET',
  'FIJIAN': 'FJ',
  'FINNISH': 'FI',
  'FRENCH': 'FR',
  'GABONESE': 'GA',
  'GAMBIAN': 'GM',
  'GEORGIAN': 'GE',
  'GERMANY': 'DE',
  'GHANAIAN': 'GH',
  'GREEK': 'GR',
  'GREENLANDER': 'GL',
  'GRENADIAN': 'GD',
  'GUADELOUPEAN': 'GP',
  'GUAMANIAN': 'GU',
  'GUATEMALAN': 'GT',
  'GUINEAN': 'GN',
  'GUYANESE': 'GY',
  'HAITIAN': 'HT',
  'HANZI': 'CN',
  'HONDURAN': 'HN',
  'HUNGARIAN': 'HU',
  'ICELANDIC': 'IS',
  'INDIAN': 'IN',
  'INDONESIAN': 'ID',
  'IRAQI': 'IQ',
  'IRISH': 'IE',
  'ISRAELI': 'IL',
  'ITALIAN': 'IT',
  'IVORIAN': 'CI',
  'JAMAICAN': 'JM',
  'JAPANESE': 'JP',
  'JORDANIAN': 'JO',
  'KAZAKHSTANI': 'KZ',
  'KENYAN': 'KE',
  'KOSOVAR': 'XK',
  'KUWAITI': 'KW',
  'KYRGYZSTANI': 'KG',
  'LEBANESE': 'LB',
  'LIBERIAN': 'LR',
  'LIECHTENSTEINER': 'LI',
  'LITHUANIAN': 'LT',
  'LYBIAN': 'LY',
  'MACANESE': 'MO',
  'MACEDONIAN': 'MK',
  'MALAGASY': 'MG',
  'MALAWIAN': 'MW',
  'MALAYSIAN': 'MY',
  'MALDIVIAN': 'MV',
  'MALTESE': 'MT',
  'MANX': 'IM',
  'MARSHALLESE': 'MH',
  'MARTINICAN': 'MQ',
  'MAURITANIAN': 'MR',
  'MAURITIAN': 'MU',
  'MAYOTTE': 'YT',
  'MEXICAN': 'MX',
  'MICRONESIAN': 'FM',
  'MOLDOVAN': 'MD',
  'MONÉGASQUE': 'MC',
  'MONGOLIAN': 'MN',
  'MONTENEGRIN': 'ME',
  'MONTSERRATIAN': 'MS',
  'MOROCCAN': 'MA',
  'MOZAMBICAN': 'MZ',
  'NAMIBIAN': 'NA',
  'NAURUAN': 'NR',
  'NEPALESE': 'NP',
  'NICARAGUAN': 'NI',
  'NIGERIAN': 'NG',
  'NIGERIEN': 'NE',
  'NIUEAN': 'NU',
  'NORWEGIAN': 'NO',
  'OMANI': 'OM',
  'PAKISTANI': 'PK',
  'PALAUAN': 'PW',
  'PALESTINIAN': 'PS',
  'PANAMANIAN': 'PA',
  'PAPUAN': 'PG',
  'PARAGUAYAN': 'PY',
  'PERUVIAN': 'PE',
  'PHILIPPINE': 'PN',
  'POLISH': 'PL',
  'PORTUGUESE': 'PT',
  'QATARI': 'QA',
  'RÉUNIONESE': 'RE',
  'ROMANIAN': 'RO',
  'RUSSIAN': 'RU',
  'RWANDAN': 'RW',
  'SAHRAWIS': 'EH',
  'SALVADORIAN': 'SV',
  'SAMMARINESE': 'SM',
  'SAMOAN': 'WS',
  'SENEGALESE': 'SN',
  'SERBIAN': 'RS',
  'SEYCHELLOIS': 'SC',
  'SINGAPOREAN': 'SG',
  'SLOVAK': 'SK',
  'SLOVENIAN': 'SI',
  'SOMALI': 'SO',
  'SPANISH': 'ES',
  'SUDANESE': 'SD',
  'SURINAMESE': 'SR',
  'SWAZI': 'SZ',
  'SWEDISH': 'SE',
  'SWISS': 'CH',
  'SYRIAN': 'SY',
  'TAIWANESE': 'TW',
  'TAJIKISTANI': 'TJ',
  'TANZANIAN': 'TZ',
  'THAI': 'TH',
  'TIMORESE': 'TL',
  'TOGOLESE': 'TG',
  'TOKELAUAN': 'TK',
  'TONGAN': 'TO',
  'TRINIDADIAN': 'TT',
  'TUNISIAN': 'TN',
  'TURKISH': 'TR',
  'TURKMEN': 'TM',
  'TUVALUAN': 'TV',
  'UGANDAN': 'UG',
  'UKRAINIAN': 'UA',
  'URUGUAYAN': 'UY',
  'UZBEKISTANI': 'UZ',
  'VANUATUAN': 'VU',
  'VENEZUELAN': 'VE',
  'VIETNAMESE': 'VN',
  'YEMENI': 'YE',
  'ZAMBIAN': 'ZM',
  'ZIMBABWEAN': 'ZW',
};

const _3to2 = {
  'AFG': 'AF',
  'ALB': 'AL',
  'DZA': 'DZ',
  'ASM': 'AS',
  'AND': 'AD',
  'AGO': 'AO',
  'AIA': 'AI',
  'ATA': 'AQ',
  'ATG': 'AG',
  'ARG': 'AR',
  'ARM': 'AM',
  'ABW': 'AW',
  'AUS': 'AU',
  'AUT': 'AT',
  'AZE': 'AZ',
  'BHS': 'BS',
  'BHR': 'BH',
  'BGD': 'BD',
  'BRB': 'BB',
  'BLR': 'BY',
  'BEL': 'BE',
  'BLZ': 'BZ',
  'BEN': 'BJ',
  'BMU': 'BM',
  'BTN': 'BT',
  'BOL': 'BO',
  'BES': 'BQ',
  'BIH': 'BA',
  'BWA': 'BW',
  'BVT': 'BV',
  'BRA': 'BR',
  'IOT': 'IO',
  'BRN': 'BN',
  'BGR': 'BG',
  'BFA': 'BF',
  'BDI': 'BI',
  'CPV': 'CV',
  'KHM': 'KH',
  'CMR': 'CM',
  'CAN': 'CA',
  'CYM': 'KY',
  'CAF': 'CF',
  'TCD': 'TD',
  'CHL': 'CL',
  'CHN': 'CN',
  'CXR': 'CX',
  'CCK': 'CC',
  'COL': 'CO',
  'COM': 'KM',
  'COD': 'CD',
  'COG': 'CG',
  'COK': 'CK',
  'CRI': 'CR',
  'HRV': 'HR',
  'CUB': 'CU',
  'CUW': 'CW',
  'CYP': 'CY',
  'CZE': 'CZ',
  'CIV': 'CI',
  'DNK': 'DK',
  'DJI': 'DJ',
  'DMA': 'DM',
  'DOM': 'DO',
  'ECU': 'EC',
  'EGY': 'EG',
  'SLV': 'SV',
  'GNQ': 'GQ',
  'ERI': 'ER',
  'EST': 'EE',
  'SWZ': 'SZ',
  'ETH': 'ET',
  'FLK': 'FK',
  'FRO': 'FO',
  'FJI': 'FJ',
  'FIN': 'FI',
  'FRA': 'FR',
  'GUF': 'GF',
  'PYF': 'PF',
  'ATF': 'TF',
  'GAB': 'GA',
  'GMB': 'GM',
  'GEO': 'GE',
  'DEU': 'DE',
  'GHA': 'GH',
  'GIB': 'GI',
  'GRC': 'GR',
  'GRL': 'GL',
  'GRD': 'GD',
  'GLP': 'GP',
  'GUM': 'GU',
  'GTM': 'GT',
  'GGY': 'GG',
  'GIN': 'GN',
  'GNB': 'GW',
  'GUY': 'GY',
  'HTI': 'HT',
  'HMD': 'HM',
  'VAT': 'VA',
  'HND': 'HN',
  'HKG': 'HK',
  'HUN': 'HU',
  'ISL': 'IS',
  'IND': 'IN',
  'IDN': 'ID',
  'IRN': 'IR',
  'IRQ': 'IQ',
  'IRL': 'IE',
  'IMN': 'IM',
  'ISR': 'IL',
  'ITA': 'IT',
  'JAM': 'JM',
  'JPN': 'JP',
  'JEY': 'JE',
  'JOR': 'JO',
  'KAZ': 'KZ',
  'KEN': 'KE',
  'KIR': 'KI',
  'PRK': 'KP',
  'KOR': 'KR',
  'KWT': 'KW',
  'KGZ': 'KG',
  'LAO': 'LA',
  'LVA': 'LV',
  'LBN': 'LB',
  'LSO': 'LS',
  'LBR': 'LR',
  'LBY': 'LY',
  'LIE': 'LI',
  'LTU': 'LT',
  'LUX': 'LU',
  'MAC': 'MO',
  'MDG': 'MG',
  'MWI': 'MW',
  'MYS': 'MY',
  'MDV': 'MV',
  'MLI': 'ML',
  'MLT': 'MT',
  'MHL': 'MH',
  'MTQ': 'MQ',
  'MRT': 'MR',
  'MUS': 'MU',
  'MYT': 'YT',
  'MEX': 'MX',
  'FSM': 'FM',
  'MDA': 'MD',
  'MCO': 'MC',
  'MNG': 'MN',
  'MNE': 'ME',
  'MSR': 'MS',
  'MAR': 'MA',
  'MOZ': 'MZ',
  'MMR': 'MM',
  'NAM': 'NA',
  'NRU': 'NR',
  'NPL': 'NP',
  'NLD': 'NL',
  'NCL': 'NC',
  'NZL': 'NZ',
  'NIC': 'NI',
  'NER': 'NE',
  'NGA': 'NG',
  'NIU': 'NU',
  'NFK': 'NF',
  'MNP': 'MP',
  'NOR': 'NO',
  'OMN': 'OM',
  'PAK': 'PK',
  'PLW': 'PW',
  'PSE': 'PS',
  'PAN': 'PA',
  'PNG': 'PG',
  'PRY': 'PY',
  'PER': 'PE',
  'PHL': 'PH',
  'PCN': 'PN',
  'POL': 'PL',
  'PRT': 'PT',
  'PRI': 'PR',
  'QAT': 'QA',
  'MKD': 'MK',
  'ROU': 'RO',
  'RUS': 'RU',
  'RWA': 'RW',
  'REU': 'RE',
  'BLM': 'BL',
  'SHN': 'SH',
  'KNA': 'KN',
  'LCA': 'LC',
  'MAF': 'MF',
  'SPM': 'PM',
  'VCT': 'VC',
  'WSM': 'WS',
  'SMR': 'SM',
  'STP': 'ST',
  'SAU': 'SA',
  'SEN': 'SN',
  'SRB': 'RS',
  'SYC': 'SC',
  'SLE': 'SL',
  'SGP': 'SG',
  'SXM': 'SX',
  'SVK': 'SK',
  'SVN': 'SI',
  'SLB': 'SB',
  'SOM': 'SO',
  'ZAF': 'ZA',
  'SGS': 'GS',
  'SSD': 'SS',
  'ESP': 'ES',
  'LKA': 'LK',
  'SDN': 'SD',
  'SUR': 'SR',
  'SJM': 'SJ',
  'SWE': 'SE',
  'CHE': 'CH',
  'SYR': 'SY',
  'TWN': 'TW',
  'TJK': 'TJ',
  'TZA': 'TZ',
  'THA': 'TH',
  'TLS': 'TL',
  'TGO': 'TG',
  'TKL': 'TK',
  'TON': 'TO',
  'TTO': 'TT',
  'TUN': 'TN',
  'TUR': 'TR',
  'TKM': 'TM',
  'TCA': 'TC',
  'TUV': 'TV',
  'UGA': 'UG',
  'UKR': 'UA',
  'ARE': 'AE',
  'GBR': 'GB',
  'UMI': 'UM',
  'USA': 'US',
  'URY': 'UY',
  'UZB': 'UZ',
  'VUT': 'VU',
  'VEN': 'VE',
  'VNM': 'VN',
  'VGB': 'VG',
  'VIR': 'VI',
  'WLF': 'WF',
  'ESH': 'EH',
  'YEM': 'YE',
  'ZMB': 'ZM',
  'ZWE': 'ZW',
  'ALA': 'AX',
};

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blinkid_settings.g.dart';

@JsonSerializable()
class BlinkIdSdkSettings {
  /// License key for the native SDK
  String licenseKey;

  /// Optional licensee string if the provided license key is not tied to the single application id
  String? licensee;

  bool helloLogEnabled = false;

  /// Whether resources required for on-device image processing should be downloaded and cached
  /// on first initialization of the SDK. If set to false, you need to package all the required
  /// resources in your application's assets.
  bool downloadResources = true;

  /// If resources are to be downloaded, the following is the URL where the resources are hosted.
  /// URL: `"https://models.cdn.microblink.com/resources"`
  String? resourceDownloadUrl;

  /// Local folder name where resources will be downloaded and cached.
  /// If resources are being downloaded, this defines the name of the folder within your
  /// application's cache folder where resources will be cached.
  String? resourceLocalFolder;

  /// If resources downloading is disabled, this defines the bundle of your app where the resources reside.
  String? bundleURL;

  /// Timeout settings for resource downloads.
  int? resourceRequestTimeout;

  BlinkIdSdkSettings(this.licenseKey);

  factory BlinkIdSdkSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdSdkSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdSdkSettingsToJson(this);
}

@JsonSerializable()
class BlinkIdSessionSettings {
  /// The scanning mode to be used during the scanning session.
  ///
  /// Specifies whether the scanning is for a single side of a document or multiple
  /// sides, as defined in ``ScanningMode``. The default is set to `.automatic`, which
  /// automatically determines the number of sides to scan.
  ScanningMode scanningMode = ScanningMode.automatic;

  /// The specific scanning settings for the scanning session.
  ///
  /// Defines various parameters that control the scanning process.
  BlinkIdScanningSettings scanningSettings = BlinkIdScanningSettings();

  /// Duration in seconds before scanning step times out and is cancelled.
  /// If less than zero, scanning will not time out.
  /// Defaults to 15.0
  int stepTimeoutDuration = 15000;

  BlinkIdSessionSettings();

  factory BlinkIdSessionSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdSessionSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdSessionSettingsToJson(this);
}

@JsonSerializable()
class BlinkIdScanningSettings {
  /// The level of blur detection in the document image.
  ///
  /// Defines the severity of blur detected in the document image, as defined
  /// in ``DetectionLevel``. Values range from `.off` (detection NotAvailable) to higher
  /// levels of blur detection.
  ///
  /// `low` – less sensitive to blur; if something is detected as blur, it is almost certainly actual blur,
  ///     but some amount of blur may not be detected at all.
  /// `high` – highly sensitive to blur; it may detect as blur even something that only resembles blur.
  ///
  /// Default: `mid`
  DetectionLevel blurDetectionLevel = DetectionLevel.mid;

  /// Indicates whether images with blur in the document image should be skipped.
  ///
  /// A value of `true` means images with detected blur will be excluded from further processing to prevent blurred images from being used
  ///     - If blurDetectionLevel = `.off` - blurred images will be processed
  ///     - If blur is detected ``ProcessingStatus`` will be `ImagePreprocessingFailed` and blur will be reported in the ``ProcessResult``
  /// A value of `false` means images with detected blur will not be excluded from further processing
  ///     - If blurDetectionLevel != `.off` - even if blur is detected, the image will be processed and blur will be reported in the ``ProcessResult``.
  ///
  /// Default: `true`
  bool skipImagesWithBlur = true;

  /// The level of glare detection in the document image.
  ///
  /// Defines the severity of glare detected in the document image, as defined in ``DetectionLevel``.
  /// Values range from `.off` (detection NotAvailable) to higher levels of glare detection.
  /// `.low` – less sensitive to glare; if something is detected as glare, it is almost certainly actual glare,
  ///     but some amount of glare may not be detected at all.
  /// `.high` – highly sensitive to glare; it may detect as glare even something that only resembles glare.
  ///
  /// Default: `.mid`
  DetectionLevel glareDetectionLevel = DetectionLevel.mid;

  /// Indicates whether images with glare in the document image should be skipped.
  ///
  /// A value of `true` means images with detected glare will be excluded from further processing to prevent glared images from being used
  ///     - If glareDetectionLevel = `.off` - glared images will be processed
  ///     - If glare is detected ``ProcessingStatus`` will be `ImagePreprocessingFailed` and glare will be reported in the ``ProcessResult``
  /// A value of `false` means images with detected glare will not be excluded from further processing
  ///     - If glareDetectionLevel != `.off` - even if glare is detected, the image will be processed and glare will be reported in the ``ProcessResult``
  ///
  /// Default: `true`
  bool skipImagesWithGlare = true;

  /// The level of allowed detected tilt of the document in the image.
  ///
  /// Defines the severity of allowed detected tilt of the document in the image, as defined in ``DetectionLevel``.
  /// Values range from `.off` (detection NotAvailable) to higher levels of allowed tilt.
  /// `.low` – less sensitive to tilt.
  /// `.high` – highly sensitive to tilt.
  ///
  /// Default: `.off`
  DetectionLevel tiltDetectionLevel = DetectionLevel.off;

  /// Indicates whether images with inadequate lighting conditions should be rejected.
  ///
  /// Inadequate lighting conditions are represented as either `TooBright` or `TooDark` document images,
  ///     as defined in the ``ImageAnalysisLightingStatus`` enum.
  /// A value of `true` means images with inadequate lighting conditions will be excluded from further processing to prevent images with
  /// inadequate lighting from being used
  ///     - If inadequate light conditions are detected ``ProcessingStatus`` will be `ImagePreprocessingFailed` and lighting status will be
  ///       reported in the ``ProcessResult``.
  ///
  /// Default: `false`
  bool skipImagesWithInadequateLightingConditions = false;

  /// Indicates whether images occluded by hand should be rejected.
  ///
  /// A value of `true` means images occluded by hand will be excluded from further processing to prevent occluded images from being used
  ///     - If hand occlusion is detected ``ProcessingStatus`` will be `ImagePreprocessingFailed` and hand occlusion status will be reported
  ///       in the ``ProcessResult``
  /// This setting is applicable only if `scanCroppedDocumentImage` = false.
  ///
  /// Default: `false`
  bool skipImagesOccludedByHand = false;

  /// Indicates whether the aggregation of data from multiple images is enabled.
  ///
  ///  Disabling this setting will yield higher-quality captured images, but it may slow down the scanning process due to the additional
  ///      effort required to find the optimal image.
  ///  Enabling this setting will simplify the extraction process, but the extracted data will be aggregated from multiple images instead
  ///      of being sourced from a single image.
  ///  This only applies to images from Video input image source - for images from Photo source, setting will be ignored.
  ///
  /// Default: `true`
  bool combineResultsFromMultipleInputImages = true;

  /// Enables barcode recognition to proceed even if the initial VIZ extraction fails.
  ///
  /// If the barcode recognition is successful, recognition will still end in a valid state.
  /// This setting is applicable only to images from Photo source.
  /// For multi-side scanning, it is permitted only for the back side.
  ///
  /// Default: `false`
  bool enableBarcodeScanOnly = false;

  /// Defines custom rules for specific document class.
  ///
  /// When defining `customDocumentRules`, `documentFilter` is optionally set to specify the document to which the rule applies, and a `fields` with
  ///     the appropriate `alphabetType` should be specified as mandatory for that document.
  /// If a `fields` is set to a field that is optional for that document or does not exist on it, all fields on the document become optional.
  /// If a `fields` is set to a field with an incorrect alphabetType, all fields on the document become optional.
  /// If a `fields` is set to a field that doesn’t exist in the internal rules, that rule is ignored.
  /// When adding multiple `fields`, any field that does not match our rules is ignored. Only fields that comply with our rules are set as mandatory.
  /// If the documentFilter fields `country`, `region`, or `type` are set to `null`, all supported values for those fields will be considered.
  ///     For example, if `country = null`, the rule will apply to all supported countries in BlinkID.
  /// By default, document fields are validated using internal rules that define mandatory fields for the scanned document class. This setting allows
  ///     users to narrow down our internal rules on mandatory fields. All undefined fields will become optional. It is not possible to mark fields as
  ///     mandatory if they cannot theoretically appear on the document.
  /// The more detailed document filter will have priority over the other.
  List<DocumentRules>? customDocumentRules;

  /// The mode of anonymization applied to the document.
  ///
  /// Redact specific fields based on requirements or laws regarding a specific document.
  /// Data can be redacted from the image, the result or both.
  ///
  /// Default: `.fullResult`
  AnonymizationMode anonymizationMode = AnonymizationMode.fullResult;

  /// Redact fields for specific document class.
  ///
  /// Fields specified by requirements or laws for a specific document will be redacted regardless of this setting.
  /// Based on anonymizationMode setting, data will be redacted from the image, the result or both.
  List<DocumentAnonymizationSettings>? customDocumentAnonymizationSettings;

  /// Indicates whether input images should be returned.
  ///
  /// Save the input images at the moment of the data extraction or timeout.
  /// This significantly increases memory consumption. The scanning performance is not affected.
  ///
  /// Default: `false`
  bool returnInputImages = false;

  /// Process only cropped document images.
  /// Requires the input image to consist solely of the cropped document image with perspective correction applied.
  /// This only applies to images from Photo input image source - for images from Video input image source, setting will be ignored.
  ///
  /// Default: `false`
  bool scanCroppedDocumentImage = false;

  /// The filter for recognition modes.
  ///
  /// Specifies which recognition modes are enabled during the scanning process, with a default value of true to enable all modes.
  /// RecognitionModeFilter is used to enable/disable recognition of specific document groups.
  ///
  /// This setting is experimental and it will be removed in upcoming releases.
  ///
  /// By default all modes are `enabled`.
  RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();

  /// Indicates whether character validation is enabled.
  ///
  /// Allow only results containing expected characters for a given field.
  /// Each field is validated against a set of rules.
  /// All fields have to be successfully validated in order to successfully scan a document.
  /// Setting is used to improve scanning accuracy.
  /// If set to `true`, when an invalid character is detected `ProcessingStatus::InvalidCharactersFound` is returned.
  ///
  /// Default: `true`
  bool enableCharacterValidation = true;

  /// Defines the minimum required margin (in percentage) between the edge of the input image and the document.
  ///
  /// The setting is applicable only when using images from Video source.
  /// The setting is not applicable if `scanCroppedDocumentImage = true` (it will be ignored).
  /// This setting is implemented to comply with regulations in certain countries that mandate documents
  /// to be stored with adequate margins in the image.
  ///
  /// Default: `0.02` (also recommended value)
  double inputImageMargin = 0.02;

  /// Indicates whether backside of unsupported document should be scanned also.
  ///
  /// By default, back side of the document will not be scanned if only the front side is supported for a specific
  /// document.
  ///
  /// Default: `false`
  bool scanUnsupportedBack = false;

  /// Indicates whether scanning can continue to the next side despite an uncertain front-side scan.
  ///
  /// This only applies to images from Photo input image source - for images from Video source, setting will be
  /// ignored.
  ///
  /// Default: `false`
  bool allowUncertainFrontSideScan = false;

  /// The maximum allowed mismatches per field during data matching.
  ///
  /// Configures the maximum number of characters per field that can be inconsistent during data matching.
  /// By defualt, no mismatches are allowed.
  ///
  /// Default: `0`
  int maxAllowedMismatchesPerField = 0;

  /// Indicates whether only the passport data page should be scanned.
  ///
  /// Scan only the data page ( page containing MRZ ) of the passport.
  /// If set to `false`, it will be required to scan the second page of certain passports.
  ///
  /// Default: `true`
  bool scanPassportDataPageOnly = true;

  /// Configures the image processing settings during the scanning process.
  ///
  /// Allows customization of cropped image handling, such as dotsPerInch, extensions, and
  /// whether images should be returned for the document, face or signature regions.
  CroppedImageSettings croppedImageSettings = CroppedImageSettings();

  BlinkIdScanningSettings();

  factory BlinkIdScanningSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdScanningSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdScanningSettingsToJson(this);
}

@JsonSerializable()
class CroppedImageSettings {
  /// The DPI value for the cropped image.
  ///
  /// Default: `250`
  int dotsPerInch = 250;

  /// The extension factor for the cropped image.
  ///
  /// Default: `0`
  double extensionFactor = 0;

  /// Indicates whether the document image should be returned.
  ///
  /// Default: `false`
  bool returnDocumentImage = false;

  /// Indicates whether the face image should be returned.
  ///
  /// Default: `false`
  bool returnFaceImage = false;

  /// Indicates whether the signature image should be returned.
  ///
  /// Default: `false`
  bool returnSignatureImage = false;

  CroppedImageSettings();

  factory CroppedImageSettings.fromJson(Map<String, dynamic> json) =>
      _$CroppedImageSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$CroppedImageSettingsToJson(this);
}

/// ClassFilter represents the document filter used to determine which documents will be processed.
/// Document information (Country, Region, Type) is evaluated with the content set in the filter, and their inclusion or exclusion depends on the defined rules.
///
/// The recognition results of the excluded documents will not be returned.
/// If using the standard BlinkID Overlay, an alert will be displayed that the document will not be scanned.
///
/// By default, the ClassFilter is turned off, and all documents will be included.
@JsonSerializable()
class ClassFilter {
  /// Document classes that will be explicitly accepted by this filter.
  /// Only documents belonging to the specified classes will be processed. All other documents will be rejected.
  ///
  /// If this array is empty, no restrictions are applied, and documents will be accepted unless explicitly excluded by `excludedClasses`.
  ///
  /// Example usage:
  ///
  /// var includedClassOne = FilteredClass();
  /// includedClassOne.country = Country.Croatia;
  /// includedClassOne.type = Type.Id;
  ///
  /// var includedClassTwo = FilteredClass();
  /// includedClassTwo.region = Region.California;
  ///
  /// var classFilter = ClassFilter();
  /// classFilter.includeClasses = [includedClassOne, includedClassTwo];
  ///
  /// NOTE: from the example above, the class filter is set to only accept Croatian IDs, and all documents from the California region.
  /// All other documents will be rejected.
  ///
  /// Rules can be combined, for example, to set all three properties (Country Region, Type), two (e.g., Country and Type) or just one (e.g, Region).
  List<DocumentFilter>? includeDocuments;

  /// Document classes that will be explicitly rejected by this filter.
  /// Documents belonging to the specified classes will not be processed. Other documents, not included with `excludeClasses` will be accepted.
  ///
  /// If this array is empty, no restrictions are applied, and documents will be excluded only if not present in `includeClasses`.
  /// If a document class appears in both `includeClasses` and `excludeClasses`, it will be accepted, as `includeClasses` takes precedence.
  ///
  /// Example usage:
  ///
  /// var excludedClassOne = FilteredClass();
  /// excludedClassOne.country = Country.Croatia;
  /// excludedClassOne.type = Type.Id;
  ///
  /// var excludedClassTwo = FilteredClass();
  /// excludedClassTwo.region = Region.California;
  ///
  /// var classFilter = ClassFilter();
  /// classFilter.excludeClasses = [excludedClassOne, excludedClassTwo];
  ///
  /// NOTE: from the example above, the class filter is set to only reject Croatian IDs, and all documents from the California region.
  /// All other classes will be accepted.
  ///
  /// Rules can be combined, for example, to set all three properties (Country Region, Type), two (e.g., Country and Type) or just one (e.g, Region).
  List<DocumentFilter>? excludeDocuments;

  ClassFilter();
  ClassFilter.withIncludedClasses(this.includeDocuments);
  ClassFilter.withExcludedClasses(this.excludeDocuments);
  ClassFilter.withAllParameters(this.includeDocuments, this.excludeDocuments);

  factory ClassFilter.fromJson(Map<String, dynamic> json) =>
      _$ClassFilterFromJson(json);
  Map<String, dynamic> toJson() => _$ClassFilterToJson(this);
}

@JsonSerializable()
class DocumentRules {
  DocumentFilter? documentFilter;

  /// An array of the document fields and alphabets that will be used with CustomClassRules. See DetailedFieldType for more information.
  List<DetailedFieldType>? detailedFieldTypes;

  DocumentRules(this.detailedFieldTypes, [this.documentFilter]);

  factory DocumentRules.fromJson(Map<String, dynamic> json) =>
      _$DocumentRulesFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentRulesToJson(this);
}

/// DetailedFieldType represents a detailed field type used for custom mandatory fields.
/// Used with CustomClassRules. A field type (see FieldType for all fields) along with Alphabet type (see AlphabetType for all alphabets) is required.
@JsonSerializable()
class DetailedFieldType {
  /// Field type that will be mandatory for extraction for CustomClassRules.
  FieldType fieldType;

  /// Alphabet type connected with the field type that will be optional for extraction for CustomClassRules. */
  AlphabetType alphabetType;

  DetailedFieldType(this.fieldType, this.alphabetType);

  factory DetailedFieldType.fromJson(Map<String, dynamic> json) =>
      _$DetailedFieldTypeFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedFieldTypeToJson(this);
}

@JsonSerializable()
class DocumentAnonymizationSettings {
  /// Document fields that will be anonymized
  List<FieldType> fields = [];

  DocumentFilter? documentFilter;

  /// Partial document number anonymization
  DocumentNumberAnonymizationSettings? documentNumberAnonymizationSettings;

  DocumentAnonymizationSettings(this.fields);
  DocumentAnonymizationSettings.withDocumentFilter(
    this.fields,
    this.documentFilter,
  );
  DocumentAnonymizationSettings.withdocumentNumberAnonymizationSettings(
    this.fields,
    this.documentNumberAnonymizationSettings,
  );
  DocumentAnonymizationSettings.withAllParameters(
    this.fields,
    this.documentFilter,
    this.documentNumberAnonymizationSettings,
  );

  factory DocumentAnonymizationSettings.fromJson(Map<String, dynamic> json) =>
      _$DocumentAnonymizationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentAnonymizationSettingsToJson(this);
}

@JsonSerializable()
class DocumentFilter {
  /// Documents from the set country will be anonymized
  Country? country;

  /// Documents from the set region will be anonymized
  Region? region;

  /// Documents with this type will be anonymized
  DocumentType? documentType;

  DocumentFilter();
  DocumentFilter.withAllParameters(
    this.country,
    this.region,
    this.documentType,
  );
  DocumentFilter.countryRegion(this.country, this.region);
  DocumentFilter.countryType(this.country, this.documentType);
  DocumentFilter.typeRegion(this.documentType, this.region);
  DocumentFilter.country(this.country);
  DocumentFilter.region(this.region);
  DocumentFilter.documentType(this.documentType);

  factory DocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$DocumentFilterFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentFilterToJson(this);
}

@JsonSerializable()
class DocumentNumberAnonymizationSettings {
  /// Set how many digits will be visible at the beggining of the document number. */
  int? prefixDigitsVisible = 0;

  /// Set how many digits will be visible at the end of the document number. */
  int? suffixDigitsVisible = 0;

  DocumentNumberAnonymizationSettings();
  DocumentNumberAnonymizationSettings.withPrefixDigitsVisible(
    this.prefixDigitsVisible,
  );
  DocumentNumberAnonymizationSettings.withsuffixDigitsVisible(
    this.suffixDigitsVisible,
  );

  DocumentNumberAnonymizationSettings.withAllParemeters(
    this.prefixDigitsVisible,
    this.suffixDigitsVisible,
  );

  factory DocumentNumberAnonymizationSettings.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentNumberAnonymizationSettingsFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DocumentNumberAnonymizationSettingsToJson(this);
}

@JsonSerializable()
class RecognitionModeFilter {
  /// Enable scanning of MRZ IDs. Setting is taken into account only if the mrz_id right is purchased.
  bool enableMrzId = true;

  /// Enable scanning of visa MRZ. Setting is taken into account only if the visa right is purchased.
  bool enableMrzVisa = true;

  /// Enable scanning of Passport MRZ. Setting is taken into account only if the passport right is purchased.
  bool enableMrzPassport = true;

  /// Enable scanning of Photo ID. Setting is taken into account only if the photo_id right is purchased.
  bool enablePhotoId = true;

  /// Enable scanning of barcode IDs. Setting is taken into account only if the barcode right to scan that barcode is purchased.
  bool enableBarcodeId = true;

  /// Enable full document recognition. Setting is taken into account only if the document right to scan that document is purchased.
  bool enableFullDocumentRecognition = true;

  RecognitionModeFilter();

  factory RecognitionModeFilter.fromJson(Map<String, dynamic> json) =>
      _$RecognitionModeFilterFromJson(json);
  Map<String, dynamic> toJson() => _$RecognitionModeFilterToJson(this);
}

enum ScanningMode {
  @JsonValue(0)
  single,

  @JsonValue(1)
  automatic,
}

enum DetectionLevel {
  @JsonValue(0)
  off,

  @JsonValue(1)
  low,

  @JsonValue(2)
  mid,

  @JsonValue(3)
  high,
}

enum AnonymizationMode {
  @JsonValue(0)
  none,

  @JsonValue(1)
  imageOnly,

  @JsonValue(2)
  resultFieldsOnly,

  @JsonValue(3)
  fullResult,
}

/// AlphabetType represents all of the alphabet types that BlinkID supports extracting.
enum AlphabetType {
  /// The Latin alphabet type
  @JsonValue(0)
  Latin,

  /// The Arabic alphabet type
  @JsonValue(1)
  Arabic,

  /// The Cyrillic alphabet type
  @JsonValue(2)
  Cyrillic,

  /// The Greek alphabet type
  @JsonValue(3)
  Greek,
}

/// Defines possible the document country from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum Country {
  @JsonValue(0)
  None,
  @JsonValue(1)
  Albania,
  @JsonValue(2)
  Algeria,
  @JsonValue(3)
  Argentina,
  @JsonValue(4)
  Australia,
  @JsonValue(5)
  Austria,
  @JsonValue(6)
  Azerbaijan,
  @JsonValue(7)
  Bahrain,
  @JsonValue(8)
  Bangladesh,
  @JsonValue(9)
  Belgium,
  @JsonValue(10)
  BosniaAndHerzegovina,
  @JsonValue(11)
  Brunei,
  @JsonValue(12)
  Bulgaria,
  @JsonValue(13)
  Cambodia,
  @JsonValue(14)
  Canada,
  @JsonValue(15)
  Chile,
  @JsonValue(16)
  Colombia,
  @JsonValue(17)
  CostaRica,
  @JsonValue(18)
  Croatia,
  @JsonValue(19)
  Cyprus,
  @JsonValue(20)
  Czechia,
  @JsonValue(21)
  Denmark,
  @JsonValue(22)
  DominicanRepublic,
  @JsonValue(23)
  Egypt,
  @JsonValue(24)
  Estonia,
  @JsonValue(25)
  Finland,
  @JsonValue(26)
  France,
  @JsonValue(27)
  Georgia,
  @JsonValue(28)
  Germany,
  @JsonValue(29)
  Ghana,
  @JsonValue(30)
  Greece,
  @JsonValue(31)
  Guatemala,
  @JsonValue(32)
  HongKong,
  @JsonValue(33)
  Hungary,
  @JsonValue(34)
  India,
  @JsonValue(35)
  Indonesia,
  @JsonValue(36)
  Ireland,
  @JsonValue(37)
  Israel,
  @JsonValue(38)
  Italy,
  @JsonValue(39)
  Jordan,
  @JsonValue(40)
  Kazakhstan,
  @JsonValue(41)
  Kenya,
  @JsonValue(42)
  Kosovo,
  @JsonValue(43)
  Kuwait,
  @JsonValue(44)
  Latvia,
  @JsonValue(45)
  Lithuania,
  @JsonValue(46)
  Malaysia,
  @JsonValue(47)
  Maldives,
  @JsonValue(48)
  Malta,
  @JsonValue(49)
  Mauritius,
  @JsonValue(50)
  Mexico,
  @JsonValue(51)
  Morocco,
  @JsonValue(52)
  Netherlands,
  @JsonValue(53)
  NewZealand,
  @JsonValue(54)
  Nigeria,
  @JsonValue(55)
  Pakistan,
  @JsonValue(56)
  Panama,
  @JsonValue(57)
  Paraguay,
  @JsonValue(58)
  Philippines,
  @JsonValue(59)
  Poland,
  @JsonValue(60)
  Portugal,
  @JsonValue(61)
  PuertoRico,
  @JsonValue(62)
  Qatar,
  @JsonValue(63)
  Romania,
  @JsonValue(64)
  Russia,
  @JsonValue(65)
  SaudiArabia,
  @JsonValue(66)
  Serbia,
  @JsonValue(67)
  Singapore,
  @JsonValue(68)
  Slovakia,
  @JsonValue(69)
  Slovenia,
  @JsonValue(70)
  SouthAfrica,
  @JsonValue(71)
  Spain,
  @JsonValue(72)
  Sweden,
  @JsonValue(73)
  Switzerland,
  @JsonValue(74)
  Taiwan,
  @JsonValue(75)
  Thailand,
  @JsonValue(76)
  Tunisia,
  @JsonValue(77)
  Turkey,
  @JsonValue(78)
  UAE,
  @JsonValue(79)
  Uganda,
  @JsonValue(80)
  UK,
  @JsonValue(81)
  Ukraine,
  @JsonValue(82)
  Usa,
  @JsonValue(83)
  Vietnam,
  @JsonValue(84)
  Brazil,
  @JsonValue(85)
  Norway,
  @JsonValue(86)
  Oman,
  @JsonValue(87)
  Ecuador,
  @JsonValue(88)
  ElSalvador,
  @JsonValue(89)
  SriLanka,
  @JsonValue(90)
  Peru,
  @JsonValue(91)
  Uruguay,
  @JsonValue(92)
  Bahamas,
  @JsonValue(93)
  Bermuda,
  @JsonValue(94)
  Bolivia,
  @JsonValue(95)
  China,
  @JsonValue(96)
  EuropeanUnion,
  @JsonValue(97)
  Haiti,
  @JsonValue(98)
  Honduras,
  @JsonValue(99)
  Iceland,
  @JsonValue(100)
  Japan,
  @JsonValue(101)
  Luxembourg,
  @JsonValue(102)
  Montenegro,
  @JsonValue(103)
  Nicaragua,
  @JsonValue(104)
  SouthKorea,
  @JsonValue(105)
  Venezuela,
  @JsonValue(106)
  Afghanistan,
  @JsonValue(107)
  AlandIslands,
  @JsonValue(108)
  AmericanSamoa,
  @JsonValue(109)
  Andorra,
  @JsonValue(110)
  Angola,
  @JsonValue(111)
  Anguilla,
  @JsonValue(112)
  Antarctica,
  @JsonValue(113)
  AntiguaAndBarbuda,
  @JsonValue(114)
  Armenia,
  @JsonValue(115)
  Aruba,
  @JsonValue(116)
  BailiwickOfGuernsey,
  @JsonValue(117)
  BailiwickOfJersey,
  @JsonValue(118)
  Barbados,
  @JsonValue(119)
  Belarus,
  @JsonValue(120)
  Belize,
  @JsonValue(121)
  Benin,
  @JsonValue(122)
  Bhutan,
  @JsonValue(123)
  BonaireSaintEustatiusAndSaba,
  @JsonValue(124)
  Botswana,
  @JsonValue(125)
  BouvetIsland,
  @JsonValue(126)
  BritishIndianOceanTerritory,
  @JsonValue(127)
  BurkinaFaso,
  @JsonValue(128)
  Burundi,
  @JsonValue(129)
  Cameroon,
  @JsonValue(130)
  CapeVerde,
  @JsonValue(131)
  CaribbeanNetherlands,
  @JsonValue(132)
  CaymanIslands,
  @JsonValue(133)
  CentralAfricanRepublic,
  @JsonValue(134)
  Chad,
  @JsonValue(135)
  ChristmasIsland,
  @JsonValue(136)
  CocosIslands,
  @JsonValue(137)
  Comoros,
  @JsonValue(138)
  Congo,
  @JsonValue(139)
  CookIslands,
  @JsonValue(140)
  Cuba,
  @JsonValue(141)
  Curacao,
  @JsonValue(142)
  DemocraticRepublicOfTheCongo,
  @JsonValue(143)
  Djibouti,
  @JsonValue(144)
  Dominica,
  @JsonValue(145)
  EastTimor,
  @JsonValue(146)
  EquatorialGuinea,
  @JsonValue(147)
  Eritrea,
  @JsonValue(148)
  Ethiopia,
  @JsonValue(149)
  FalklandIslands,
  @JsonValue(150)
  FaroeIslands,
  @JsonValue(151)
  FederatedStatesOfMicronesia,
  @JsonValue(152)
  Fiji,
  @JsonValue(153)
  FrenchGuiana,
  @JsonValue(154)
  FrenchPolynesia,
  @JsonValue(155)
  FrenchSouthernTerritories,
  @JsonValue(156)
  Gabon,
  @JsonValue(157)
  Gambia,
  @JsonValue(158)
  Gibraltar,
  @JsonValue(159)
  Greenland,
  @JsonValue(160)
  Grenada,
  @JsonValue(161)
  Guadeloupe,
  @JsonValue(162)
  Guam,
  @JsonValue(163)
  Guinea,
  @JsonValue(164)
  GuineaBissau,
  @JsonValue(165)
  Guyana,
  @JsonValue(166)
  HeardIslandAndMcdonaldIslands,
  @JsonValue(167)
  Iran,
  @JsonValue(168)
  Iraq,
  @JsonValue(169)
  IsleOfMan,
  @JsonValue(170)
  IvoryCoast,
  @JsonValue(171)
  Jamaica,
  @JsonValue(172)
  Kiribati,
  @JsonValue(173)
  Kyrgyzstan,
  @JsonValue(183)
  Laos,
  @JsonValue(184)
  Lebanon,
  @JsonValue(185)
  Lesotho,
  @JsonValue(186)
  Liberia,
  @JsonValue(187)
  Libya,
  @JsonValue(188)
  Liechtenstein,
  @JsonValue(189)
  Macau,
  @JsonValue(190)
  Madagascar,
  @JsonValue(191)
  Malawi,
  @JsonValue(192)
  Mali,
  @JsonValue(193)
  MarshallIslands,
  @JsonValue(194)
  Martinique,
  @JsonValue(195)
  Mauritania,
  @JsonValue(196)
  Mayotte,
  @JsonValue(197)
  Moldova,
  @JsonValue(198)
  Monaco,
  @JsonValue(199)
  Mongolia,
  @JsonValue(200)
  Montserrat,
  @JsonValue(201)
  Mozambique,
  @JsonValue(202)
  Myanmar,
  @JsonValue(203)
  Namibia,
  @JsonValue(204)
  Nauru,
  @JsonValue(205)
  Nepal,
  @JsonValue(206)
  NewCaledonia,
  @JsonValue(207)
  Niger,
  @JsonValue(208)
  Niue,
  @JsonValue(209)
  NorfolkIsland,
  @JsonValue(210)
  NorthernCyprus,
  @JsonValue(211)
  NorthernMarianaIslands,
  @JsonValue(212)
  NorthKorea,
  @JsonValue(213)
  NorthMacedonia,
  @JsonValue(214)
  Palau,
  @JsonValue(215)
  Palestine,
  @JsonValue(216)
  PapuaNewGuinea,
  @JsonValue(217)
  Pitcairn,
  @JsonValue(218)
  Reunion,
  @JsonValue(219)
  Rwanda,
  @JsonValue(220)
  SaintBarthelemy,
  @JsonValue(221)
  SaintHelenaAscensionAndTristianDaCunha,
  @JsonValue(222)
  SaintKittsAndNevis,
  @JsonValue(223)
  SaintLucia,
  @JsonValue(224)
  SaintMartin,
  @JsonValue(225)
  SaintPierreAndMiquelon,
  @JsonValue(226)
  SaintVincentAndTheGrenadines,
  @JsonValue(227)
  Samoa,
  @JsonValue(228)
  SanMarino,
  @JsonValue(229)
  SaoTomeAndPrincipe,
  @JsonValue(230)
  Senegal,
  @JsonValue(231)
  Seychelles,
  @JsonValue(232)
  SierraLeone,
  @JsonValue(233)
  SintMaarten,
  @JsonValue(234)
  SolomonIslands,
  @JsonValue(235)
  Somalia,
  @JsonValue(236)
  SouthGeorgiaAndTheSouthSandwichIslands,
  @JsonValue(237)
  SouthSudan,
  @JsonValue(238)
  Sudan,
  @JsonValue(239)
  Suriname,
  @JsonValue(240)
  SvalbardAndJanMayen,
  @JsonValue(241)
  Eswatini,
  @JsonValue(242)
  Syria,
  @JsonValue(243)
  Tajikistan,
  @JsonValue(244)
  Tanzania,
  @JsonValue(245)
  Togo,
  @JsonValue(246)
  Tokelau,
  @JsonValue(247)
  Tonga,
  @JsonValue(248)
  TrinidadAndTobago,
  @JsonValue(249)
  Turkmenistan,
  @JsonValue(250)
  TurksAndCaicosIslands,
  @JsonValue(251)
  Tuvalu,
  @JsonValue(252)
  UnitedStatesMinorOutlyingIslands,
  @JsonValue(253)
  Uzbekistan,
  @JsonValue(254)
  Vanuatu,
  @JsonValue(255)
  VaticanCity,
  @JsonValue(256)
  VirginIslandsBritish,
  @JsonValue(257)
  VirginIslandsUs,
  @JsonValue(258)
  WallisAndFutuna,
  @JsonValue(259)
  WesternSahara,
  @JsonValue(260)
  Yemen,
  @JsonValue(261)
  Yugoslavia,
  @JsonValue(262)
  Zambia,
  @JsonValue(263)
  Zimbabwe,
  @JsonValue(264)
  SchengenArea,
}

/// Defines possible the document country's region from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum Region {
  @JsonValue(0)
  None,
  @JsonValue(1)
  Alabama,
  @JsonValue(2)
  Alaska,
  @JsonValue(3)
  Alberta,
  @JsonValue(4)
  Arizona,
  @JsonValue(5)
  Arkansas,
  @JsonValue(6)
  AustralianCapitalTerritory,
  @JsonValue(7)
  BritishColumbia,
  @JsonValue(8)
  California,
  @JsonValue(9)
  Colorado,
  @JsonValue(10)
  Connecticut,
  @JsonValue(11)
  Delaware,
  @JsonValue(12)
  DistrictOfColumbia,
  @JsonValue(13)
  Florida,
  @JsonValue(14)
  Georgia,
  @JsonValue(15)
  Hawaii,
  @JsonValue(16)
  Idaho,
  @JsonValue(17)
  Illinois,
  @JsonValue(18)
  Indiana,
  @JsonValue(19)
  Iowa,
  @JsonValue(20)
  Kansas,
  @JsonValue(21)
  Kentucky,
  @JsonValue(22)
  Louisiana,
  @JsonValue(23)
  Maine,
  @JsonValue(24)
  Manitoba,
  @JsonValue(25)
  Maryland,
  @JsonValue(26)
  Massachusetts,
  @JsonValue(27)
  Michigan,
  @JsonValue(28)
  Minnesota,
  @JsonValue(29)
  Mississippi,
  @JsonValue(30)
  Missouri,
  @JsonValue(31)
  Montana,
  @JsonValue(32)
  Nebraska,
  @JsonValue(33)
  Nevada,
  @JsonValue(34)
  NewBrunswick,
  @JsonValue(35)
  NewHampshire,
  @JsonValue(36)
  NewJersey,
  @JsonValue(37)
  NewMexico,
  @JsonValue(38)
  NewSouthWales,
  @JsonValue(39)
  NewYork,
  @JsonValue(40)
  NorthernTerritory,
  @JsonValue(41)
  NorthCarolina,
  @JsonValue(42)
  NorthDakota,
  @JsonValue(43)
  NovaScotia,
  @JsonValue(44)
  Ohio,
  @JsonValue(45)
  Oklahoma,
  @JsonValue(46)
  Ontario,
  @JsonValue(47)
  Oregon,
  @JsonValue(48)
  Pennsylvania,
  @JsonValue(49)
  Quebec,
  @JsonValue(50)
  Queensland,
  @JsonValue(51)
  RhodeIsland,
  @JsonValue(52)
  Saskatchewan,
  @JsonValue(53)
  SouthAustralia,
  @JsonValue(54)
  SouthCarolina,
  @JsonValue(55)
  SouthDakota,
  @JsonValue(56)
  Tasmania,
  @JsonValue(57)
  Tennessee,
  @JsonValue(58)
  Texas,
  @JsonValue(59)
  Utah,
  @JsonValue(60)
  Vermont,
  @JsonValue(61)
  Victoria,
  @JsonValue(62)
  Virginia,
  @JsonValue(63)
  Washington,
  @JsonValue(64)
  WesternAustralia,
  @JsonValue(65)
  WestVirginia,
  @JsonValue(66)
  Wisconsin,
  @JsonValue(67)
  Wyoming,
  @JsonValue(68)
  Yukon,
  @JsonValue(69)
  CiudadDeMexico,
  @JsonValue(70)
  Jalisco,
  @JsonValue(71)
  NewfoundlandAndLabrador,
  @JsonValue(72)
  NuevoLeon,
  @JsonValue(73)
  BajaCalifornia,
  @JsonValue(74)
  Chihuahua,
  @JsonValue(75)
  Guanajuato,
  @JsonValue(76)
  Guerrero,
  @JsonValue(77)
  Mexico,
  @JsonValue(78)
  Michoacan,
  @JsonValue(79)
  NewYorkCity,
  @JsonValue(80)
  Tamaulipas,
  @JsonValue(81)
  Veracruz,
  @JsonValue(82)
  Chiapas,
  @JsonValue(83)
  Coahuila,
  @JsonValue(84)
  Durango,
  @JsonValue(85)
  GuerreroCocula,
  @JsonValue(86)
  GuerreroJuchitan,
  @JsonValue(87)
  GuerreroTepecoacuilco,
  @JsonValue(88)
  GuerreroTlacoapa,
  @JsonValue(89)
  Gujarat,
  @JsonValue(90)
  Hidalgo,
  @JsonValue(91)
  Karnataka,
  @JsonValue(92)
  Kerala,
  @JsonValue(93)
  KhyberPakhtunkhwa,
  @JsonValue(94)
  MadhyaPradesh,
  @JsonValue(95)
  Maharashtra,
  @JsonValue(96)
  Morelos,
  @JsonValue(97)
  Nayarit,
  @JsonValue(98)
  Oaxaca,
  @JsonValue(99)
  Puebla,
  @JsonValue(100)
  Punjab,
  @JsonValue(101)
  Queretaro,
  @JsonValue(102)
  SanLuisPotosi,
  @JsonValue(103)
  Sinaloa,
  @JsonValue(104)
  Sonora,
  @JsonValue(105)
  Tabasco,
  @JsonValue(106)
  TamilNadu,
  @JsonValue(107)
  Yucatan,
  @JsonValue(108)
  Zacatecas,
  @JsonValue(109)
  Aguascalientes,
  @JsonValue(110)
  BajaCaliforniaSur,
  @JsonValue(111)
  Campeche,
  @JsonValue(112)
  Colima,
  @JsonValue(113)
  QuintanaRooBenitoJuarez,
  @JsonValue(114)
  QuintanaRoo,
  @JsonValue(115)
  QuintanaRooSolidaridad,
  @JsonValue(116)
  Tlaxcala,
  @JsonValue(117)
  QuintanaRooCozumel,
  @JsonValue(118)
  SaoPaolo,
  @JsonValue(119)
  RioDeJaneiro,
  @JsonValue(120)
  RioGrandeDoSul,
  @JsonValue(121)
  NorthWestTerritories,
  @JsonValue(122)
  Nunavut,
  @JsonValue(123)
  PrinceEdwardIsland,
  @JsonValue(124)
  DistritoFederal,
  @JsonValue(125)
  Maranhao,
  @JsonValue(126)
  MatoGrosso,
  @JsonValue(127)
  MinasGerais,
  @JsonValue(128)
  Para,
  @JsonValue(129)
  Parana,
  @JsonValue(130)
  Pernambuco,
  @JsonValue(131)
  SantaCatarina,
  @JsonValue(132)
  AndhraPradesh,
  @JsonValue(133)
  Ceara,
  @JsonValue(134)
  Goias,
  @JsonValue(135)
  GuerreroAcapulcoDeJuarez,
  @JsonValue(136)
  Haryana,
  @JsonValue(137)
  Sergipe,
  @JsonValue(138)
  Alagos,
  @JsonValue(139)
  Bangsamoro,
}

/// Defines possible the document type from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum DocumentType {
  @JsonValue(0)
  None,
  @JsonValue(1)
  ConsularId,
  @JsonValue(2)
  Dl,
  @JsonValue(3)
  DlPublicServicesCard,
  @JsonValue(4)
  EmploymentPass,
  @JsonValue(5)
  FinCard,
  @JsonValue(6)
  Id,
  @JsonValue(7)
  MultipurposeId,
  @JsonValue(8)
  MyKad,
  @JsonValue(9)
  MyKid,
  @JsonValue(10)
  MyPR,
  @JsonValue(11)
  MyTentera,
  @JsonValue(12)
  PanCard,
  @JsonValue(13)
  ProfessionalId,
  @JsonValue(14)
  PublicServicesCard,
  @JsonValue(15)
  ResidencePermit,
  @JsonValue(16)
  ResidentId,
  @JsonValue(17)
  TemporaryResidencePermit,
  @JsonValue(18)
  VoterId,
  @JsonValue(19)
  WorkPermit,
  @JsonValue(20)
  iKad,
  @JsonValue(21)
  MilitaryId,
  @JsonValue(22)
  MyKas,
  @JsonValue(23)
  SocialSecurityCard,
  @JsonValue(24)
  HealthInsuranceCard,
  @JsonValue(25)
  Passport,
  @JsonValue(26)
  SPass,
  @JsonValue(27)
  AddressCard,
  @JsonValue(28)
  AlienId,
  @JsonValue(29)
  AlienPassport,
  @JsonValue(30)
  GreenCard,
  @JsonValue(31)
  MinorsId,
  @JsonValue(32)
  PostalId,
  @JsonValue(33)
  ProfessionalDl,
  @JsonValue(34)
  TaxId,
  @JsonValue(35)
  WeaponPermit,
  @JsonValue(36)
  Visa,
  @JsonValue(37)
  BorderCrossingCard,
  @JsonValue(38)
  DriverCard,
  @JsonValue(39)
  GlobalEntryCard,
  @JsonValue(40)
  Mypolis,
  @JsonValue(41)
  NexusCard,
  @JsonValue(42)
  PassportCard,
  @JsonValue(43)
  ProofOfAgeCard,
  @JsonValue(44)
  RefugeeId,
  @JsonValue(45)
  TribalId,
  @JsonValue(46)
  VeteranId,
  @JsonValue(47)
  CitizenshipCertificate,
  @JsonValue(48)
  MyNumberCard,
  @JsonValue(49)
  ConsularPassport,
  @JsonValue(50)
  MinorsPassport,
  @JsonValue(51)
  MinorsPublicServicesCard,
  @JsonValue(52)
  DrivingPriviligeCard,
  @JsonValue(53)
  AsylumRequest,
  @JsonValue(54)
  DriverQualificationCard,
  @JsonValue(55)
  ProvisionalDl,
  @JsonValue(56)
  RefugeePassport,
  @JsonValue(57)
  SpecialId,
  @JsonValue(58)
  UniformedServicesId,
  @JsonValue(59)
  ImmigrantVisa,
  @JsonValue(60)
  ConsularVoterId,
  @JsonValue(61)
  TwicCard,
  @JsonValue(62)
  ExitEntryPermit,
  @JsonValue(63)
  MainlandTravelPermitTaiwan,
  @JsonValue(64)
  NbiClearance,
  @JsonValue(65)
  ProofOfRegistration,
  @JsonValue(66)
  TemporaryProtectionPermit,
  @JsonValue(67)
  AfghanCitizenCard,
  @JsonValue(68)
  EId,
  @JsonValue(69)
  Pass,
  @JsonValue(70)
  SisId,
  @JsonValue(71)
  AsicCard,
  @JsonValue(72)
  BidoonCard,
  @JsonValue(73)
  InterimHealthInsuranceCard,
  @JsonValue(74)
  NonVoterId,
  @JsonValue(75)
  ReciprocalHealthInsuranceCard,
  @JsonValue(76)
  VehicleRegistration,
  @JsonValue(77)
  EsaadCard,
}

enum FieldType {
  @JsonValue(0)
  AdditionalAddressInformation,
  @JsonValue(1)
  AdditionalNameInformation,
  @JsonValue(2)
  AdditionalOptionalAddressInformation,
  @JsonValue(3)
  AdditionalPersonalIdNumber,
  @JsonValue(4)
  Address,
  @JsonValue(5)
  ClassEffectiveDate,
  @JsonValue(6)
  ClassExpiryDate,
  @JsonValue(7)
  Conditions,
  @JsonValue(8)
  DateOfBirth,
  @JsonValue(9)
  DateOfExpiry,
  @JsonValue(10)
  DateOfIssue,
  @JsonValue(11)
  DocumentAdditionalNumber,
  @JsonValue(12)
  DocumentOptionalAdditionalNumber,
  @JsonValue(13)
  DocumentNumber,
  @JsonValue(14)
  Employer,
  @JsonValue(15)
  Endorsements,
  @JsonValue(16)
  FathersName,
  @JsonValue(17)
  FirstName,
  @JsonValue(18)
  FullName,
  @JsonValue(19)
  IssuingAuthority,
  @JsonValue(20)
  LastName,
  @JsonValue(21)
  LicenceType,
  @JsonValue(22)
  LocalizedName,
  @JsonValue(23)
  MaritalStatus,
  @JsonValue(24)
  MothersName,
  @JsonValue(25)
  Mrz,
  @JsonValue(26)
  Nationality,
  @JsonValue(27)
  PersonalIdNumber,
  @JsonValue(28)
  PlaceOfBirth,
  @JsonValue(29)
  Profession,
  @JsonValue(30)
  Race,
  @JsonValue(31)
  Religion,
  @JsonValue(32)
  ResidentialStatus,
  @JsonValue(33)
  Restrictions,
  @JsonValue(34)
  Sex,
  @JsonValue(35)
  VehicleClass,
  @JsonValue(36)
  BloodType,
  @JsonValue(37)
  Sponsor,
  @JsonValue(38)
  VisaType,
  @JsonValue(39)
  DocumentSubtype,
  @JsonValue(40)
  Remarks,
  @JsonValue(41)
  ResidencePermitType,
  @JsonValue(42)
  ManufacturingYear,
  @JsonValue(43)
  VehicleType,
  @JsonValue(44)
  DependentDateOfBirth,
  @JsonValue(45)
  DependentSex,
  @JsonValue(46)
  DependentDocumentNumber,
  @JsonValue(47)
  DependentFullName,
  @JsonValue(48)
  EligibilityCategory,
  @JsonValue(49)
  SpecificDocumentValidity,
  @JsonValue(50)
  VehicleOwner,
}

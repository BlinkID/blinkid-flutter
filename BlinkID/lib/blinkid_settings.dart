import 'package:json_annotation/json_annotation.dart';
part 'blinkid_settings.g.dart';

/// Settings for the initialization of the BlinkID SDK.
@JsonSerializable()
class BlinkIdSdkSettings {
  /// License key for the native SDK
  String licenseKey;

  /// Optional licensee string if the provided license key is not tied to the single application ID
  String? licensee;

  /// Whether resources required for on-device image processing should be downloaded and cached
  /// on first initialization of the SDK.
  /// If set to false, you need to package all the required
  /// resources in your application's assets.
  bool? downloadResources;

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

  /// Settings for the initialization of the BlinkID SDK.
  BlinkIdSdkSettings(
    this.licenseKey, [
    licensee,
    downloadResources,
    resourceDownloadUrl,
    resourceLocalFolder,
    bundleURL,
    resourceRequestTimeout,
  ]);

  factory BlinkIdSdkSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdSdkSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdSdkSettingsToJson(this);
}

/// Represents the configuration settings for a scanning session.
///
/// This class holds the settings related to the resources initialization,
/// scanning mode, and specific scanning configurations that define how the scanning
/// session should behave.
@JsonSerializable()
class BlinkIdSessionSettings {
  /// The scanning mode to be used during the scanning session.
  ///
  /// Specifies whether the scanning is for a single side of a document or multiple
  /// sides, as defined in [ScanningMode]. The default is set to `automatic`, which
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

  /// Represents the configuration settings for a scanning session.
  ///
  /// This class holds the settings related to the resources initialization,
  /// scanning mode, and specific scanning configurations that define how the scanning
  /// session should behave.
  BlinkIdSessionSettings();

  factory BlinkIdSessionSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdSessionSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdSessionSettingsToJson(this);
}

/// Represents the configurable settings for scanning a document.
///
/// This class defines various parameters and policies related to the scanning
/// process, including image quality handling, data extraction and anonymization,
/// along with options for frame processing and image extraction.
@JsonSerializable()
class BlinkIdScanningSettings {
  /// The level of blur detection in the document image.
  ///
  /// Defines the severity of blur detected in the document image, as defined
  /// in [DetectionLevel]. Values range from `off` (detection NotAvailable) to higher
  /// levels of blur detection.
  ///
  /// `low` – less sensitive to blur; if something is detected as blur, it is almost certainly actual blur,
  ///  but some amount of blur may not be detected at all.
  /// `high` – highly sensitive to blur; it may detect as blur even something that only resembles blur.
  ///
  /// Default: [DetectionLevel.mid]
  DetectionLevel blurDetectionLevel = DetectionLevel.mid;

  /// Indicates whether images with blur in the document image should be skipped.
  ///
  /// A value of `true` means images with detected blur will be excluded from further processing to prevent blurred images from being used
  ///     - If blurDetectionLevel = `off` - blurred images will be processed
  ///     - If blur is detected `ProcessingStatus` will be `ImagePreprocessingFailed` and blur will be reported in the `ProcessResult`
  /// A value of `false` means images with detected blur will not be excluded from further processing
  ///     - If blurDetectionLevel != `off` - even if blur is detected, the image will be processed and blur will be reported in the `ProcessResult`.
  ///
  /// Default: `true`
  bool skipImagesWithBlur = true;

  /// The level of glare detection in the document image.
  ///
  /// Defines the severity of glare detected in the document image, as defined in [DetectionLevel].
  /// Values range from `off` (detection NotAvailable) to higher levels of glare detection.
  /// `low` – less sensitive to glare; if something is detected as glare, it is almost certainly actual glare,
  ///     but some amount of glare may not be detected at all.
  /// `high` – highly sensitive to glare; it may detect as glare even something that only resembles glare.
  ///
  /// Default: [DetectionLevel.mid]
  DetectionLevel glareDetectionLevel = DetectionLevel.mid;

  /// Indicates whether images with glare in the document image should be skipped.
  ///
  /// A value of `true` means images with detected glare will be excluded from further processing to prevent glared images from being used
  ///     - If glareDetectionLevel = `off` - glared images will be processed
  ///     - If glare is detected `ProcessingStatus` will be `ImagePreprocessingFailed` and glare will be reported in the `ProcessResult`
  /// A value of `false` means images with detected glare will not be excluded from further processing
  ///     - If glareDetectionLevel != `off` - even if glare is detected, the image will be processed and glare will be reported in the `ProcessResult`
  ///
  /// Default: `true`
  bool skipImagesWithGlare = true;

  /// The level of allowed detected tilt of the document in the image.
  ///
  /// Defines the severity of allowed detected tilt of the document in the image, as defined in [DetectionLevel].
  /// Values range from `off` (detection NotAvailable) to higher levels of allowed tilt.
  /// `low` – less sensitive to tilt.
  /// `high` – highly sensitive to tilt.
  ///
  /// Default: [DetectionLevel.off]
  DetectionLevel tiltDetectionLevel = DetectionLevel.off;

  /// Indicates whether images with inadequate lighting conditions should be rejected.
  ///
  /// Inadequate lighting conditions are represented as either `TooBright` or `TooDark` document images,
  ///     as defined in the `ImageAnalysisLightingStatus` enum.
  /// A value of `true` means images with inadequate lighting conditions will be excluded from further processing to prevent images with
  /// inadequate lighting from being used
  ///     - If inadequate light conditions are detected `ProcessingStatus` will be `ImagePreprocessingFailed` and lighting status will be
  ///       reported in the `ProcessResult`.
  ///
  /// Default: `false`
  bool skipImagesWithInadequateLightingConditions = false;

  /// Indicates whether images occluded by hand should be rejected.
  ///
  /// A value of `true` means images occluded by hand will be excluded from further processing to prevent occluded images from being used
  ///     - If hand occlusion is detected `ProcessingStatus` will be `ImagePreprocessingFailed` and hand occlusion status will be reported
  ///       in the `ProcessResult`
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
  /// When defining [DocumentRules], [DocumentFilter] is optionally set to specify the document to which the rule applies, and a `fields` with
  ///     the appropriate `alphabetType` should be specified as mandatory for that document.
  /// If a `fields` is set to a field that is optional for that document or does not exist on it, all fields on the document become optional.
  /// If a `fields` is set to a field with an incorrect alphabetType, all fields on the document become optional.
  /// If a `fields` is set to a field that doesn’t exist in the internal rules, that rule is ignored.
  /// When adding multiple `fields`, any field that does not match our rules is ignored. Only fields that comply with our rules are set as mandatory.
  /// If the documentFilter fields `country`, `region`, or `type` are set to `null`, all supported values for those fields will be considered.
  ///     For example, if `country = null`, the rule will apply to all supported countries in BlinkID.
  ///
  /// By default, document fields are validated using internal rules that define mandatory fields for the scanned document class. This setting allows
  ///     users to narrow down our internal rules on mandatory fields. All undefined fields will become optional. It is not possible to mark fields as
  ///     mandatory if they cannot theoretically appear on the document.
  /// The more detailed document filter will have priority over the other.
  ///
  /// See [DocumentRules] for more detailed information.
  List<DocumentRules>? customDocumentRules;

  /// The mode of anonymization applied to the document.
  ///
  /// Redact specific fields based on requirements or laws regarding a specific document.
  /// Data can be redacted from the image, the result or both.
  ///
  /// Default: [AnonymizationMode.fullResult]
  AnonymizationMode anonymizationMode = AnonymizationMode.fullResult;

  /// Redact fields for specific document class.
  ///
  /// Fields specified by requirements or laws for a specific document will be redacted regardless of this setting.
  /// Based on anonymizationMode setting, data will be redacted from the image, the result or both.
  ///
  /// See [DocumentAnonymizationSettings] for more information.
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
  /// [RecognitionModeFilter] is used to enable/disable recognition of specific document groups.
  ///
  /// This setting is experimental and it will be removed in upcoming releases.
  ///
  /// By default all modes are enabled (set to `true`).
  RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();

  /// Indicates whether character validation is enabled.
  ///
  /// Allow only results containing expected characters for a given field.
  /// Each field is validated against a set of rules.
  /// All fields have to be successfully validated in order to successfully scan a document.
  /// Setting is used to improve scanning accuracy.
  /// If set to `true`, when an invalid character is detected `ProcessingStatus.InvalidCharactersFound` is returned.
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
  ///
  /// See [CroppedImageSettings] for more information.
  CroppedImageSettings croppedImageSettings = CroppedImageSettings();

  /// Represents the configurable settings for scanning a document.
  ///
  /// This class defines various parameters and policies related to the scanning
  /// process, including image quality handling, data extraction and anonymization,
  /// along with options for frame processing and image extraction.
  BlinkIdScanningSettings();

  factory BlinkIdScanningSettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdScanningSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdScanningSettingsToJson(this);
}

/// Represents the image cropping settings.
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

  /// Represents the image cropping settings.
  CroppedImageSettings();

  factory CroppedImageSettings.fromJson(Map<String, dynamic> json) =>
      _$CroppedImageSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$CroppedImageSettingsToJson(this);
}

/// ClassFilter represents the document filter used to determine which documents will be processed.
/// Document information (Country, Region, Type) is evaluated with the content set in the filter, and their inclusion or exclusion depends on the defined rules.
/// To set the document information, use [DocumentFilter].
/// The recognition results of the excluded documents will not be returned.
/// If using the standard BlinkID UX, an alert will be displayed that the document will not be scanned.
///
/// By default, the ClassFilter is turned off, and all documents will be included.
@JsonSerializable()
class ClassFilter {
  /// Document classes that will be explicitly accepted by this filter.
  /// Only documents belonging to the specified classes will be processed. All other documents will be rejected.
  ///
  /// If this list is empty, no restrictions are applied, and documents will be accepted unless explicitly excluded by `excludeDocuments`.
  ///
  /// Example usage:
  ///
  ///  ```
  ///   final classFilter = ClassFilter();
  ///    classFilter.includeDocuments = [
  ///      DocumentFilter.country(Country.Usa),
  ///      DocumentFilter.countryType(Country.Croatia, DocumentType.Id),
  ///    ];
  ///
  ///    await blinkIdPlugin.performScan(sdkSettings, sessionSettings classFilter)
  ///  ```
  ///
  ///
  /// NOTE: from the example above, the class filter is set to only accept all documents from USA, and Croatian IDs.
  /// All other documents will be rejected.
  ///
  /// Rules can be combined, for example, to set all three properties (Country Region, Type), two (e.g., Country and Type) or just one (e.g, Region).
  ///
  /// See [DocumentFilter] for setting the combinations.
  List<DocumentFilter>? includeDocuments;

  /// Document classes that will be explicitly rejected by this filter.
  /// Documents belonging to the specified classes will not be processed. Other documents, not included with `excludeDocuments` will be accepted.
  ///
  /// If this array is empty, no restrictions are applied, and documents will be excluded only if not present in `includeDocuments`.
  ///
  /// Example usage:
  ///
  ///  ```
  ///   final classFilter = ClassFilter();
  ///    classFilter.excludeDocuments = [
  ///      DocumentFilter.country(Country.Usa),
  ///      DocumentFilter.countryType(Country.Croatia, DocumentType.Id),
  ///    ];
  ///
  ///    await blinkIdPlugin.performScan(sdkSettings, sessionSettings classFilter)
  ///  ```
  ///
  /// NOTE: from the example above, the class filter is set to only exclude all documents from USA, and Croatian IDs.
  /// All other classes will be accepted.
  ///
  /// Rules can be combined, for example, to set all three properties (Country Region, Type), two (e.g., Country and Type) or just one (e.g, Region).
  ///
  /// See [DocumentFilter] for setting the combinations.
  List<DocumentFilter>? excludeDocuments;

  /// ClassFilter represents the document filter used to determine which documents will be processed.
  /// Document information (Country, Region, Type) is evaluated with the content set in the filter, and their inclusion or exclusion depends on the defined rules.
  /// To set the document information, use [DocumentFilter].
  /// The recognition results of the excluded documents will not be returned.
  /// If using the standard BlinkID UX, an alert will be displayed that the document will not be scanned.
  ///
  /// By default, the ClassFilter is turned off, and all documents will be included.
  ClassFilter();

  /// Constructor for only adding the document clasess that will be included for the scanning process.
  ClassFilter.withIncludedClasses(this.includeDocuments);

  /// Constructor for only adding the document clasess that will be excluded for the scanning process.
  ClassFilter.withExcludedClasses(this.excludeDocuments);

  /// Constructor for adding both the document clasess that will be included and excluded for the scanning process.
  ClassFilter.withAllParameters(this.includeDocuments, this.excludeDocuments);

  factory ClassFilter.fromJson(Map<String, dynamic> json) =>
      _$ClassFilterFromJson(json);
  Map<String, dynamic> toJson() => _$ClassFilterToJson(this);
}

/// Represents the custom document rules.
///
/// This setting allows users to narrow down our internal rules on mandatory fields. All undefined fields will become optional.
/// It is not possible to mark fields as mandatory if they cannot theoretically appear on the document.
/// The more detailed document filter will have priority over the other.
///
/// Document fields are validated using internal rules that define mandatory fields for the scanned document class.
@JsonSerializable()
class DocumentRules {
  /// Specified fields will overrule our document class field rules if filter conditions are met.
  ///
  /// See [DocumentFilter] for more information.
  DocumentFilter? documentFilter;

  /// Fields to overrule our class field rules.
  ///
  /// [DetailedFieldType] for more information.
  List<DetailedFieldType>? detailedFieldTypes;

  /// Represents the custom document rules.
  ///
  /// This setting allows users to narrow down our internal rules on mandatory fields. All undefined fields will become optional.
  /// It is not possible to mark fields as mandatory if they cannot theoretically appear on the document.
  /// The more detailed document filter will have priority over the other.
  ///
  /// Document fields are validated using internal rules that define mandatory fields for the scanned document class.
  /// Defines custom rules for specific document class.
  ///
  /// When defining [DocumentRules], [DocumentFilter] is optionally set to specify the document to which the rule applies, and a `fields` with
  ///     the appropriate `alphabetType` should be specified as mandatory for that document.
  /// If a `fields` is set to a field that is optional for that document or does not exist on it, all fields on the document become optional.
  /// If a `fields` is set to a field with an incorrect alphabetType, all fields on the document become optional.
  /// If a `fields` is set to a field that doesn’t exist in the internal rules, that rule is ignored.
  /// When adding multiple `fields`, any field that does not match our rules is ignored. Only fields that comply with our rules are set as mandatory.
  /// If the documentFilter fields `country`, `region`, or `type` are set to `null`, all supported values for those fields will be considered.
  ///     For example, if `country = null`, the rule will apply to all supported countries in BlinkID.
  DocumentRules(this.detailedFieldTypes, [this.documentFilter]);

  factory DocumentRules.fromJson(Map<String, dynamic> json) =>
      _$DocumentRulesFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentRulesToJson(this);
}

/// Represents the detailed field type.
@JsonSerializable()
class DetailedFieldType {
  /// The field type.
  ///
  /// See [FieldType] for more information.
  FieldType fieldType;

  /// The alphabet type.
  ///
  /// See [AlphabetType] for more information.
  AlphabetType alphabetType;

  /// Represents the detailed field type.
  /// Both the [FieldType] and [AlphabetType] are mandatory.
  DetailedFieldType(this.fieldType, this.alphabetType);

  factory DetailedFieldType.fromJson(Map<String, dynamic> json) =>
      _$DetailedFieldTypeFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedFieldTypeToJson(this);
}

/// Represents the document anonymization settings.
@JsonSerializable()
class DocumentAnonymizationSettings {
  /// Document fields that will be anonymized.
  List<FieldType> fields = [];

  /// Specified fields will be anonymized if filter conditions are met.
  DocumentFilter? documentFilter;

  /// Document number anonymization settings.
  DocumentNumberAnonymizationSettings? documentNumberAnonymizationSettings;

  /// Represents the document anonymization settings.
  DocumentAnonymizationSettings(this.fields);

  /// Represents the document anonymization settings, additionally with setting the [DocumentFilter].
  DocumentAnonymizationSettings.withDocumentFilter(
    this.fields,
    this.documentFilter,
  );

  /// Represents the document anonymization settings, additionally with setting the [DocumentNumberAnonymizationSettings].
  DocumentAnonymizationSettings.withdocumentNumberAnonymizationSettings(
    this.fields,
    this.documentNumberAnonymizationSettings,
  );

  /// Represents the document anonymization settings, with all parameters.
  DocumentAnonymizationSettings.withAllParameters(
    this.fields,
    this.documentFilter,
    this.documentNumberAnonymizationSettings,
  );

  factory DocumentAnonymizationSettings.fromJson(Map<String, dynamic> json) =>
      _$DocumentAnonymizationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentAnonymizationSettingsToJson(this);
}

/// Represents the document filter.
/// Used with other classes like the [ClassFilter], [DocumentRules] and the [DocumentAnonymizationSettings].
@JsonSerializable()
class DocumentFilter {
  /// If set, only specified country will pass the filter criteria.
  /// Otherwise, issuing country will not betaken into account.
  Country? country;

  /// If set, only specified country will pass the filter criteria.
  /// Otherwise, issuing region will not be taken into account.
  Region? region;

  /// If set, only specified type will pass the filter criteria. Otherwise, issuing type will not be taken into
  /// account.
  DocumentType? documentType;

  /// Represents the document filter.
  /// Used with other classes like the [ClassFilter], [DocumentRules] and the [DocumentAnonymizationSettings].
  DocumentFilter();

  /// Set the document filter with all parameters: [Country], [Region], and [DocumentType].
  DocumentFilter.withAllParameters(
    this.country,
    this.region,
    this.documentType,
  );

  /// Set the document filter with the following parameters: [Country] and [Region].
  DocumentFilter.countryRegion(this.country, this.region);

  /// Set the document filter with the following parameters: [Country] and [DocumentType].
  DocumentFilter.countryType(this.country, this.documentType);

  /// Set the document filter with the following parameters: [Region] and [DocumentType].
  DocumentFilter.typeRegion(this.documentType, this.region);

  /// Set the document filter only with the [Country] parameter.
  DocumentFilter.country(this.country);

  /// Set the document filter only with the [Region] parameter.
  DocumentFilter.region(this.region);

  /// Set the document filter only with the [DocumentType] parameter.
  DocumentFilter.documentType(this.documentType);

  factory DocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$DocumentFilterFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentFilterToJson(this);
}

/// Represents the document number anonymization settings.
@JsonSerializable()
class DocumentNumberAnonymizationSettings {
  /// Defines how many digits at the beginning of the document number remain visible after anonymization.
  int? prefixDigitsVisible = 0;

  /// Defines how many digits at the end of the document number remain visible after anonymization.
  int? suffixDigitsVisible = 0;

  /// Represents the document number anonymization settings.
  DocumentNumberAnonymizationSettings();

  /// Represents the document number anonymization settings, additionally with setting the `prefixDigitsVisible`.
  DocumentNumberAnonymizationSettings.withPrefixDigitsVisible(
    this.prefixDigitsVisible,
  );

  /// Represents the document number anonymization settings, additionally with setting the `suffixDigitsVisible`.
  DocumentNumberAnonymizationSettings.withsuffixDigitsVisible(
    this.suffixDigitsVisible,
  );

  /// Represents the document number anonymization settings, additionally with setting both `prefixDigitsVisible` and `suffixDigitsVisible`.
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

/// Represents the configuration used to enable/disable recognition of specific
/// document groups.
///
/// By default all modes are enabled.
@JsonSerializable()
class RecognitionModeFilter {
  /// Enable scanning of MRZ IDs.
  bool enableMrzId = true;

  /// Enable scanning of visa MRZ.
  bool enableMrzVisa = true;

  /// Enable scanning of Passport MRZ.
  bool enableMrzPassport = true;

  /// Enable scanning of Photo ID.
  bool enablePhotoId = true;

  /// Enable scanning of barcode IDs.
  bool enableBarcodeId = true;

  /// Enable full document recognition.
  bool enableFullDocumentRecognition = true;

  /// Represents the configuration used to enable/disable recognition of specific
  /// document groups.
  ///
  /// By default all modes are enabled.
  RecognitionModeFilter();

  factory RecognitionModeFilter.fromJson(Map<String, dynamic> json) =>
      _$RecognitionModeFilterFromJson(json);
  Map<String, dynamic> toJson() => _$RecognitionModeFilterToJson(this);
}

/// BlinkID enums

/// Represents the mode of document scanning.
///
/// This enum class defines whether the scanning process is limited to a single
/// side of the document or includes multiple sides, automatically identifying how many sides need to be scanned.
enum ScanningMode {
  /// Specifies the scanning process to be for single side only.
  @JsonValue(0)
  single,

  /// The default [ScanningMode] which
  ///
  ///  Automatically determines the number of sides to scan.
  @JsonValue(1)
  automatic,
}

/// Represents the different levels of detection sensitivity.
///
/// This enum class is used to configure detection thresholds and enable or
/// disable detection functionality. The levels range from turning detection
/// off completely to setting various levels of sensitivity (low, mid, high).
enum DetectionLevel {
  /// Disables the [DetectionLevel]
  @JsonValue(0)
  off,

  /// Sets the [DetectionLevel] to be less sensitive.
  @JsonValue(1)
  low,

  /// The default [DetectionLevel] sensitivity.
  @JsonValue(2)
  mid,

  /// Sets the [DetectionLevel] to be highly sensitive.
  @JsonValue(3)
  high,
}

/// Represents level of anonymization performed on the scanning result.
enum AnonymizationMode {
  /// Anonymization will not be performed.
  @JsonValue(0)
  none,

  /// Full document image is anonymized with black boxes covering sensitive data.
  @JsonValue(1)
  imageOnly,

  /// Result fields containing sensitive data are removed from result.
  @JsonValue(2)
  resultFieldsOnly,

  /// This mode is combination of `imageOnly` and `resultFieldsOnly` modes.
  @JsonValue(3)
  fullResult,
}

/// Represents the type of the alphabet used in the document.
enum AlphabetType {
  /// The Latin alphabet type
  @JsonValue(0)
  latin,

  /// The Arabic alphabet type
  @JsonValue(1)
  arabic,

  /// The Cyrillic alphabet type
  @JsonValue(2)
  cyrillic,

  /// The Greek alphabet type
  @JsonValue(3)
  greek,
}

/// Document country.
enum Country {
  @JsonValue(0)
  none,
  @JsonValue(1)
  albania,
  @JsonValue(2)
  algeria,
  @JsonValue(3)
  argentina,
  @JsonValue(4)
  australia,
  @JsonValue(5)
  austria,
  @JsonValue(6)
  azerbaijan,
  @JsonValue(7)
  bahrain,
  @JsonValue(8)
  bangladesh,
  @JsonValue(9)
  belgium,
  @JsonValue(10)
  bosniaAndHerzegovina,
  @JsonValue(11)
  brunei,
  @JsonValue(12)
  bulgaria,
  @JsonValue(13)
  bambodia,
  @JsonValue(14)
  canada,
  @JsonValue(15)
  chile,
  @JsonValue(16)
  colombia,
  @JsonValue(17)
  costaRica,
  @JsonValue(18)
  croatia,
  @JsonValue(19)
  cyprus,
  @JsonValue(20)
  czechia,
  @JsonValue(21)
  denmark,
  @JsonValue(22)
  dominicanRepublic,
  @JsonValue(23)
  egypt,
  @JsonValue(24)
  estonia,
  @JsonValue(25)
  finland,
  @JsonValue(26)
  france,
  @JsonValue(27)
  georgia,
  @JsonValue(28)
  germany,
  @JsonValue(29)
  ghana,
  @JsonValue(30)
  greece,
  @JsonValue(31)
  guatemala,
  @JsonValue(32)
  hongKong,
  @JsonValue(33)
  hungary,
  @JsonValue(34)
  india,
  @JsonValue(35)
  indonesia,
  @JsonValue(36)
  ireland,
  @JsonValue(37)
  israel,
  @JsonValue(38)
  italy,
  @JsonValue(39)
  jordan,
  @JsonValue(40)
  kazakhstan,
  @JsonValue(41)
  kenya,
  @JsonValue(42)
  kosovo,
  @JsonValue(43)
  kuwait,
  @JsonValue(44)
  latvia,
  @JsonValue(45)
  lithuania,
  @JsonValue(46)
  malaysia,
  @JsonValue(47)
  maldives,
  @JsonValue(48)
  malta,
  @JsonValue(49)
  mauritius,
  @JsonValue(50)
  mexico,
  @JsonValue(51)
  morocco,
  @JsonValue(52)
  netherlands,
  @JsonValue(53)
  newZealand,
  @JsonValue(54)
  nigeria,
  @JsonValue(55)
  pakistan,
  @JsonValue(56)
  panama,
  @JsonValue(57)
  paraguay,
  @JsonValue(58)
  philippines,
  @JsonValue(59)
  poland,
  @JsonValue(60)
  portugal,
  @JsonValue(61)
  puertoRico,
  @JsonValue(62)
  qatar,
  @JsonValue(63)
  romania,
  @JsonValue(64)
  russia,
  @JsonValue(65)
  saudiArabia,
  @JsonValue(66)
  serbia,
  @JsonValue(67)
  singapore,
  @JsonValue(68)
  slovakia,
  @JsonValue(69)
  slovenia,
  @JsonValue(70)
  southAfrica,
  @JsonValue(71)
  spain,
  @JsonValue(72)
  sweden,
  @JsonValue(73)
  switzerland,
  @JsonValue(74)
  taiwan,
  @JsonValue(75)
  thailand,
  @JsonValue(76)
  tunisia,
  @JsonValue(77)
  turkey,
  @JsonValue(78)
  uae,
  @JsonValue(79)
  gganda,
  @JsonValue(80)
  uK,
  @JsonValue(81)
  ukraine,
  @JsonValue(82)
  usa,
  @JsonValue(83)
  vietnam,
  @JsonValue(84)
  brazil,
  @JsonValue(85)
  norway,
  @JsonValue(86)
  oman,
  @JsonValue(87)
  ecuador,
  @JsonValue(88)
  elSalvador,
  @JsonValue(89)
  sriLanka,
  @JsonValue(90)
  peru,
  @JsonValue(91)
  uruguay,
  @JsonValue(92)
  bahamas,
  @JsonValue(93)
  bermuda,
  @JsonValue(94)
  bolivia,
  @JsonValue(95)
  china,
  @JsonValue(96)
  europeanUnion,
  @JsonValue(97)
  haiti,
  @JsonValue(98)
  honduras,
  @JsonValue(99)
  iceland,
  @JsonValue(100)
  japan,
  @JsonValue(101)
  luxembourg,
  @JsonValue(102)
  montenegro,
  @JsonValue(103)
  nicaragua,
  @JsonValue(104)
  southKorea,
  @JsonValue(105)
  venezuela,
  @JsonValue(106)
  afghanistan,
  @JsonValue(107)
  alandIslands,
  @JsonValue(108)
  americanSamoa,
  @JsonValue(109)
  andorra,
  @JsonValue(110)
  angola,
  @JsonValue(111)
  anguilla,
  @JsonValue(112)
  antarctica,
  @JsonValue(113)
  antiguaAndBarbuda,
  @JsonValue(114)
  armenia,
  @JsonValue(115)
  aruba,
  @JsonValue(116)
  bailiwickOfGuernsey,
  @JsonValue(117)
  bailiwickOfJersey,
  @JsonValue(118)
  barbados,
  @JsonValue(119)
  belarus,
  @JsonValue(120)
  belize,
  @JsonValue(121)
  benin,
  @JsonValue(122)
  bhutan,
  @JsonValue(123)
  bonaireSaintEustatiusAndSaba,
  @JsonValue(124)
  botswana,
  @JsonValue(125)
  bouvetIsland,
  @JsonValue(126)
  britishIndianOceanTerritory,
  @JsonValue(127)
  burkinaFaso,
  @JsonValue(128)
  burundi,
  @JsonValue(129)
  cameroon,
  @JsonValue(130)
  capeVerde,
  @JsonValue(131)
  caribbeanNetherlands,
  @JsonValue(132)
  caymanIslands,
  @JsonValue(133)
  centralAfricanRepublic,
  @JsonValue(134)
  chad,
  @JsonValue(135)
  christmasIsland,
  @JsonValue(136)
  cocosIslands,
  @JsonValue(137)
  comoros,
  @JsonValue(138)
  congo,
  @JsonValue(139)
  cookIslands,
  @JsonValue(140)
  cuba,
  @JsonValue(141)
  curacao,
  @JsonValue(142)
  democraticRepublicOfTheCongo,
  @JsonValue(143)
  djibouti,
  @JsonValue(144)
  dominica,
  @JsonValue(145)
  eastTimor,
  @JsonValue(146)
  equatorialGuinea,
  @JsonValue(147)
  eritrea,
  @JsonValue(148)
  ethiopia,
  @JsonValue(149)
  falklandIslands,
  @JsonValue(150)
  faroeIslands,
  @JsonValue(151)
  federatedStatesOfMicronesia,
  @JsonValue(152)
  fiji,
  @JsonValue(153)
  frenchGuiana,
  @JsonValue(154)
  frenchPolynesia,
  @JsonValue(155)
  frenchSouthernTerritories,
  @JsonValue(156)
  gabon,
  @JsonValue(157)
  gambia,
  @JsonValue(158)
  gibraltar,
  @JsonValue(159)
  greenland,
  @JsonValue(160)
  grenada,
  @JsonValue(161)
  guadeloupe,
  @JsonValue(162)
  guam,
  @JsonValue(163)
  guinea,
  @JsonValue(164)
  guineaBissau,
  @JsonValue(165)
  guyana,
  @JsonValue(166)
  heardIslandAndMcdonaldIslands,
  @JsonValue(167)
  iran,
  @JsonValue(168)
  iraq,
  @JsonValue(169)
  isleOfMan,
  @JsonValue(170)
  ivoryCoast,
  @JsonValue(171)
  jamaica,
  @JsonValue(172)
  kiribati,
  @JsonValue(173)
  kyrgyzstan,
  @JsonValue(183)
  laos,
  @JsonValue(184)
  lebanon,
  @JsonValue(185)
  lesotho,
  @JsonValue(186)
  liberia,
  @JsonValue(187)
  libya,
  @JsonValue(188)
  liechtenstein,
  @JsonValue(189)
  macau,
  @JsonValue(190)
  madagascar,
  @JsonValue(191)
  malawi,
  @JsonValue(192)
  mali,
  @JsonValue(193)
  marshallIslands,
  @JsonValue(194)
  martinique,
  @JsonValue(195)
  mauritania,
  @JsonValue(196)
  mayotte,
  @JsonValue(197)
  moldova,
  @JsonValue(198)
  monaco,
  @JsonValue(199)
  mongolia,
  @JsonValue(200)
  montserrat,
  @JsonValue(201)
  mozambique,
  @JsonValue(202)
  myanmar,
  @JsonValue(203)
  namibia,
  @JsonValue(204)
  nauru,
  @JsonValue(205)
  nepal,
  @JsonValue(206)
  newCaledonia,
  @JsonValue(207)
  niger,
  @JsonValue(208)
  niue,
  @JsonValue(209)
  norfolkIsland,
  @JsonValue(210)
  northernCyprus,
  @JsonValue(211)
  northernMarianaIslands,
  @JsonValue(212)
  northKorea,
  @JsonValue(213)
  northMacedonia,
  @JsonValue(214)
  palau,
  @JsonValue(215)
  palestine,
  @JsonValue(216)
  papuaNewGuinea,
  @JsonValue(217)
  pitcairn,
  @JsonValue(218)
  reunion,
  @JsonValue(219)
  rwanda,
  @JsonValue(220)
  saintBarthelemy,
  @JsonValue(221)
  saintHelenaAscensionAndTristianDaCunha,
  @JsonValue(222)
  saintKittsAndNevis,
  @JsonValue(223)
  saintLucia,
  @JsonValue(224)
  saintMartin,
  @JsonValue(225)
  saintPierreAndMiquelon,
  @JsonValue(226)
  saintVincentAndTheGrenadines,
  @JsonValue(227)
  samoa,
  @JsonValue(228)
  sanMarino,
  @JsonValue(229)
  saoTomeAndPrincipe,
  @JsonValue(230)
  senegal,
  @JsonValue(231)
  seychelles,
  @JsonValue(232)
  sierraLeone,
  @JsonValue(233)
  sintMaarten,
  @JsonValue(234)
  solomonIslands,
  @JsonValue(235)
  somalia,
  @JsonValue(236)
  southGeorgiaAndTheSouthSandwichIslands,
  @JsonValue(237)
  southSudan,
  @JsonValue(238)
  sudan,
  @JsonValue(239)
  suriname,
  @JsonValue(240)
  svalbardAndJanMayen,
  @JsonValue(241)
  eswatini,
  @JsonValue(242)
  syria,
  @JsonValue(243)
  tajikistan,
  @JsonValue(244)
  tanzania,
  @JsonValue(245)
  togo,
  @JsonValue(246)
  tokelau,
  @JsonValue(247)
  tonga,
  @JsonValue(248)
  trinidadAndTobago,
  @JsonValue(249)
  turkmenistan,
  @JsonValue(250)
  turksAndCaicosIslands,
  @JsonValue(251)
  tuvalu,
  @JsonValue(252)
  unitedStatesMinorOutlyingIslands,
  @JsonValue(253)
  uzbekistan,
  @JsonValue(254)
  vanuatu,
  @JsonValue(255)
  vaticanCity,
  @JsonValue(256)
  virginIslandsBritish,
  @JsonValue(257)
  virginIslandsUs,
  @JsonValue(258)
  wallisAndFutuna,
  @JsonValue(259)
  westernSahara,
  @JsonValue(260)
  yemen,
  @JsonValue(261)
  yugoslavia,
  @JsonValue(262)
  zambia,
  @JsonValue(263)
  zimbabwe,
  @JsonValue(264)
  schengenArea,
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

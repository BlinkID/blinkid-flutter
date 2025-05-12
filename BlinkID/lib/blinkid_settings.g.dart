// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blinkid_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdSdkSettings _$BlinkIdSdkSettingsFromJson(Map<String, dynamic> json) =>
    BlinkIdSdkSettings(
      json['licenseKey'] as String,
      json['licensee'],
      json['downloadResources'],
      json['resourceDownloadUrl'],
      json['resourceLocalFolder'],
      json['bundleURL'],
      json['resourceRequestTimeout'],
    );

Map<String, dynamic> _$BlinkIdSdkSettingsToJson(BlinkIdSdkSettings instance) =>
    <String, dynamic>{
      'licenseKey': instance.licenseKey,
      'licensee': instance.licensee,
      'downloadResources': instance.downloadResources,
      'resourceDownloadUrl': instance.resourceDownloadUrl,
      'resourceLocalFolder': instance.resourceLocalFolder,
      'bundleURL': instance.bundleURL,
      'resourceRequestTimeout': instance.resourceRequestTimeout,
    };

BlinkIdSessionSettings _$BlinkIdSessionSettingsFromJson(
  Map<String, dynamic> json,
) =>
    BlinkIdSessionSettings()
      ..scanningMode = $enumDecode(_$ScanningModeEnumMap, json['scanningMode'])
      ..scanningSettings = BlinkIdScanningSettings.fromJson(
        json['scanningSettings'] as Map<String, dynamic>,
      )
      ..stepTimeoutDuration = (json['stepTimeoutDuration'] as num).toInt();

Map<String, dynamic> _$BlinkIdSessionSettingsToJson(
  BlinkIdSessionSettings instance,
) => <String, dynamic>{
  'scanningMode': _$ScanningModeEnumMap[instance.scanningMode]!,
  'scanningSettings': instance.scanningSettings,
  'stepTimeoutDuration': instance.stepTimeoutDuration,
};

const _$ScanningModeEnumMap = {
  ScanningMode.single: 0,
  ScanningMode.automatic: 1,
};

BlinkIdScanningSettings _$BlinkIdScanningSettingsFromJson(
  Map<String, dynamic> json,
) =>
    BlinkIdScanningSettings()
      ..blurDetectionLevel = $enumDecode(
        _$DetectionLevelEnumMap,
        json['blurDetectionLevel'],
      )
      ..skipImagesWithBlur = json['skipImagesWithBlur'] as bool
      ..glareDetectionLevel = $enumDecode(
        _$DetectionLevelEnumMap,
        json['glareDetectionLevel'],
      )
      ..skipImagesWithGlare = json['skipImagesWithGlare'] as bool
      ..tiltDetectionLevel = $enumDecode(
        _$DetectionLevelEnumMap,
        json['tiltDetectionLevel'],
      )
      ..skipImagesWithInadequateLightingConditions =
          json['skipImagesWithInadequateLightingConditions'] as bool
      ..skipImagesOccludedByHand = json['skipImagesOccludedByHand'] as bool
      ..combineResultsFromMultipleInputImages =
          json['combineResultsFromMultipleInputImages'] as bool
      ..enableBarcodeScanOnly = json['enableBarcodeScanOnly'] as bool
      ..customDocumentRules =
          (json['customDocumentRules'] as List<dynamic>?)
              ?.map((e) => DocumentRules.fromJson(e as Map<String, dynamic>))
              .toList()
      ..anonymizationMode = $enumDecode(
        _$AnonymizationModeEnumMap,
        json['anonymizationMode'],
      )
      ..customDocumentAnonymizationSettings =
          (json['customDocumentAnonymizationSettings'] as List<dynamic>?)
              ?.map(
                (e) => DocumentAnonymizationSettings.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList()
      ..returnInputImages = json['returnInputImages'] as bool
      ..scanCroppedDocumentImage = json['scanCroppedDocumentImage'] as bool
      ..recognitionModeFilter = RecognitionModeFilter.fromJson(
        json['recognitionModeFilter'] as Map<String, dynamic>,
      )
      ..enableCharacterValidation = json['enableCharacterValidation'] as bool
      ..inputImageMargin = (json['inputImageMargin'] as num).toDouble()
      ..scanUnsupportedBack = json['scanUnsupportedBack'] as bool
      ..allowUncertainFrontSideScan =
          json['allowUncertainFrontSideScan'] as bool
      ..maxAllowedMismatchesPerField =
          (json['maxAllowedMismatchesPerField'] as num).toInt()
      ..scanPassportDataPageOnly = json['scanPassportDataPageOnly'] as bool
      ..croppedImageSettings = CroppedImageSettings.fromJson(
        json['croppedImageSettings'] as Map<String, dynamic>,
      );

Map<String, dynamic> _$BlinkIdScanningSettingsToJson(
  BlinkIdScanningSettings instance,
) => <String, dynamic>{
  'blurDetectionLevel': _$DetectionLevelEnumMap[instance.blurDetectionLevel]!,
  'skipImagesWithBlur': instance.skipImagesWithBlur,
  'glareDetectionLevel': _$DetectionLevelEnumMap[instance.glareDetectionLevel]!,
  'skipImagesWithGlare': instance.skipImagesWithGlare,
  'tiltDetectionLevel': _$DetectionLevelEnumMap[instance.tiltDetectionLevel]!,
  'skipImagesWithInadequateLightingConditions':
      instance.skipImagesWithInadequateLightingConditions,
  'skipImagesOccludedByHand': instance.skipImagesOccludedByHand,
  'combineResultsFromMultipleInputImages':
      instance.combineResultsFromMultipleInputImages,
  'enableBarcodeScanOnly': instance.enableBarcodeScanOnly,
  'customDocumentRules': instance.customDocumentRules,
  'anonymizationMode': _$AnonymizationModeEnumMap[instance.anonymizationMode]!,
  'customDocumentAnonymizationSettings':
      instance.customDocumentAnonymizationSettings,
  'returnInputImages': instance.returnInputImages,
  'scanCroppedDocumentImage': instance.scanCroppedDocumentImage,
  'recognitionModeFilter': instance.recognitionModeFilter,
  'enableCharacterValidation': instance.enableCharacterValidation,
  'inputImageMargin': instance.inputImageMargin,
  'scanUnsupportedBack': instance.scanUnsupportedBack,
  'allowUncertainFrontSideScan': instance.allowUncertainFrontSideScan,
  'maxAllowedMismatchesPerField': instance.maxAllowedMismatchesPerField,
  'scanPassportDataPageOnly': instance.scanPassportDataPageOnly,
  'croppedImageSettings': instance.croppedImageSettings,
};

const _$DetectionLevelEnumMap = {
  DetectionLevel.off: 0,
  DetectionLevel.low: 1,
  DetectionLevel.mid: 2,
  DetectionLevel.high: 3,
};

const _$AnonymizationModeEnumMap = {
  AnonymizationMode.none: 0,
  AnonymizationMode.imageOnly: 1,
  AnonymizationMode.resultFieldsOnly: 2,
  AnonymizationMode.fullResult: 3,
};

CroppedImageSettings _$CroppedImageSettingsFromJson(
  Map<String, dynamic> json,
) =>
    CroppedImageSettings()
      ..dotsPerInch = (json['dotsPerInch'] as num).toInt()
      ..extensionFactor = (json['extensionFactor'] as num).toDouble()
      ..returnDocumentImage = json['returnDocumentImage'] as bool
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnSignatureImage = json['returnSignatureImage'] as bool;

Map<String, dynamic> _$CroppedImageSettingsToJson(
  CroppedImageSettings instance,
) => <String, dynamic>{
  'dotsPerInch': instance.dotsPerInch,
  'extensionFactor': instance.extensionFactor,
  'returnDocumentImage': instance.returnDocumentImage,
  'returnFaceImage': instance.returnFaceImage,
  'returnSignatureImage': instance.returnSignatureImage,
};

ClassFilter _$ClassFilterFromJson(Map<String, dynamic> json) =>
    ClassFilter()
      ..includeDocuments =
          (json['includeDocuments'] as List<dynamic>?)
              ?.map((e) => DocumentFilter.fromJson(e as Map<String, dynamic>))
              .toList()
      ..excludeDocuments =
          (json['excludeDocuments'] as List<dynamic>?)
              ?.map((e) => DocumentFilter.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$ClassFilterToJson(ClassFilter instance) =>
    <String, dynamic>{
      'includeDocuments': instance.includeDocuments,
      'excludeDocuments': instance.excludeDocuments,
    };

DocumentRules _$DocumentRulesFromJson(Map<String, dynamic> json) =>
    DocumentRules(
      (json['fields'] as List<dynamic>)
          .map((e) => DetailedFieldType.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['documentFilter'] == null
          ? null
          : DocumentFilter.fromJson(
            json['documentFilter'] as Map<String, dynamic>,
          ),
    );

Map<String, dynamic> _$DocumentRulesToJson(DocumentRules instance) =>
    <String, dynamic>{
      'documentFilter': instance.documentFilter,
      'fields': instance.fields,
    };

DetailedFieldType _$DetailedFieldTypeFromJson(Map<String, dynamic> json) =>
    DetailedFieldType(
      $enumDecode(_$FieldTypeEnumMap, json['fieldType']),
      $enumDecode(_$AlphabetTypeEnumMap, json['alphabetType']),
    );

Map<String, dynamic> _$DetailedFieldTypeToJson(DetailedFieldType instance) =>
    <String, dynamic>{
      'fieldType': _$FieldTypeEnumMap[instance.fieldType]!,
      'alphabetType': _$AlphabetTypeEnumMap[instance.alphabetType]!,
    };

const _$FieldTypeEnumMap = {
  FieldType.additionalAddressInformation: 'additionalAddressInformation',
  FieldType.additionalNameInformation: 'additionalNameInformation',
  FieldType.additionalOptionalAddressInformation:
      'additionalOptionalAddressInformation',
  FieldType.additionalPersonalIdNumber: 'additionalPersonalIdNumber',
  FieldType.address: 'address',
  FieldType.classEffectiveDate: 'classEffectiveDate',
  FieldType.classExpiryDate: 'classExpiryDate',
  FieldType.conditions: 'conditions',
  FieldType.dateOfBirth: 'dateOfBirth',
  FieldType.dateOfExpiry: 'dateOfExpiry',
  FieldType.dateOfIssue: 'dateOfIssue',
  FieldType.documentAdditionalNumber: 'documentAdditionalNumber',
  FieldType.documentOptionalAdditionalNumber:
      'documentOptionalAdditionalNumber',
  FieldType.documentNumber: 'documentNumber',
  FieldType.employer: 'employer',
  FieldType.endorsements: 'endorsements',
  FieldType.fathersName: 'fathersName',
  FieldType.firstName: 'firstName',
  FieldType.fullName: 'fullName',
  FieldType.issuingAuthority: 'issuingAuthority',
  FieldType.lastName: 'lastName',
  FieldType.licenceType: 'licenceType',
  FieldType.localizedName: 'localizedName',
  FieldType.maritalStatus: 'maritalStatus',
  FieldType.mothersName: 'mothersName',
  FieldType.mrz: 'mrz',
  FieldType.nationality: 'nationality',
  FieldType.personalIdNumber: 'personalIdNumber',
  FieldType.placeOfBirth: 'placeOfBirth',
  FieldType.profession: 'profession',
  FieldType.race: 'race',
  FieldType.religion: 'religion',
  FieldType.residentialStatus: 'residentialStatus',
  FieldType.restrictions: 'restrictions',
  FieldType.sex: 'sex',
  FieldType.vehicleClass: 'vehicleClass',
  FieldType.bloodType: 'bloodType',
  FieldType.sponsor: 'sponsor',
  FieldType.visaType: 'visaType',
  FieldType.documentSubtype: 'documentSubtype',
  FieldType.remarks: 'remarks',
  FieldType.residencePermitType: 'residencePermitType',
  FieldType.manufacturingYear: 'manufacturingYear',
  FieldType.vehicleType: 'vehicleType',
  FieldType.dependentDateOfBirth: 'dependentDateOfBirth',
  FieldType.dependentSex: 'dependentSex',
  FieldType.dependentDocumentNumber: 'dependentDocumentNumber',
  FieldType.dependentFullName: 'dependentFullName',
  FieldType.eligibilityCategory: 'eligibilityCategory',
  FieldType.specificDocumentValidity: 'specificDocumentValidity',
  FieldType.vehicleOwner: 'vehicleOwner',
};

const _$AlphabetTypeEnumMap = {
  AlphabetType.latin: 'latin',
  AlphabetType.arabic: 'arabic',
  AlphabetType.cyrillic: 'cyrillic',
  AlphabetType.greek: 'greek',
};

DocumentAnonymizationSettings _$DocumentAnonymizationSettingsFromJson(
  Map<String, dynamic> json,
) => DocumentAnonymizationSettings(
  (json['fields'] as List<dynamic>)
      .map((e) => $enumDecode(_$FieldTypeEnumMap, e))
      .toList(),
  json['documentFilter'] == null
      ? null
      : DocumentFilter.fromJson(json['documentFilter'] as Map<String, dynamic>),
  json['documentNumberAnonymizationSettings'] == null
      ? null
      : DocumentNumberAnonymizationSettings.fromJson(
        json['documentNumberAnonymizationSettings'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$DocumentAnonymizationSettingsToJson(
  DocumentAnonymizationSettings instance,
) => <String, dynamic>{
  'fields': instance.fields.map((e) => _$FieldTypeEnumMap[e]!).toList(),
  'documentFilter': instance.documentFilter,
  'documentNumberAnonymizationSettings':
      instance.documentNumberAnonymizationSettings,
};

DocumentFilter _$DocumentFilterFromJson(Map<String, dynamic> json) =>
    DocumentFilter(
      $enumDecodeNullable(_$CountryEnumMap, json['country']),
      $enumDecodeNullable(_$RegionEnumMap, json['region']),
      $enumDecodeNullable(_$DocumentTypeEnumMap, json['documentType']),
    );

Map<String, dynamic> _$DocumentFilterToJson(DocumentFilter instance) =>
    <String, dynamic>{
      'country': _$CountryEnumMap[instance.country],
      'region': _$RegionEnumMap[instance.region],
      'documentType': _$DocumentTypeEnumMap[instance.documentType],
    };

const _$CountryEnumMap = {
  Country.none: 'none',
  Country.albania: 'albania',
  Country.algeria: 'algeria',
  Country.argentina: 'argentina',
  Country.australia: 'australia',
  Country.austria: 'austria',
  Country.azerbaijan: 'azerbaijan',
  Country.bahrain: 'bahrain',
  Country.bangladesh: 'bangladesh',
  Country.belgium: 'belgium',
  Country.bosniaAndHerzegovina: 'bosniaAndHerzegovina',
  Country.brunei: 'brunei',
  Country.bulgaria: 'bulgaria',
  Country.bambodia: 'bambodia',
  Country.canada: 'canada',
  Country.chile: 'chile',
  Country.colombia: 'colombia',
  Country.costaRica: 'costaRica',
  Country.croatia: 'croatia',
  Country.cyprus: 'cyprus',
  Country.czechia: 'czechia',
  Country.denmark: 'denmark',
  Country.dominicanRepublic: 'dominicanRepublic',
  Country.egypt: 'egypt',
  Country.estonia: 'estonia',
  Country.finland: 'finland',
  Country.france: 'france',
  Country.georgia: 'georgia',
  Country.germany: 'germany',
  Country.ghana: 'ghana',
  Country.greece: 'greece',
  Country.guatemala: 'guatemala',
  Country.hongKong: 'hongKong',
  Country.hungary: 'hungary',
  Country.india: 'india',
  Country.indonesia: 'indonesia',
  Country.ireland: 'ireland',
  Country.israel: 'israel',
  Country.italy: 'italy',
  Country.jordan: 'jordan',
  Country.kazakhstan: 'kazakhstan',
  Country.kenya: 'kenya',
  Country.kosovo: 'kosovo',
  Country.kuwait: 'kuwait',
  Country.latvia: 'latvia',
  Country.lithuania: 'lithuania',
  Country.malaysia: 'malaysia',
  Country.maldives: 'maldives',
  Country.malta: 'malta',
  Country.mauritius: 'mauritius',
  Country.mexico: 'mexico',
  Country.morocco: 'morocco',
  Country.netherlands: 'netherlands',
  Country.newZealand: 'newZealand',
  Country.nigeria: 'nigeria',
  Country.pakistan: 'pakistan',
  Country.panama: 'panama',
  Country.paraguay: 'paraguay',
  Country.philippines: 'philippines',
  Country.poland: 'poland',
  Country.portugal: 'portugal',
  Country.puertoRico: 'puertoRico',
  Country.qatar: 'qatar',
  Country.romania: 'romania',
  Country.russia: 'russia',
  Country.saudiArabia: 'saudiArabia',
  Country.serbia: 'serbia',
  Country.singapore: 'singapore',
  Country.slovakia: 'slovakia',
  Country.slovenia: 'slovenia',
  Country.southAfrica: 'southAfrica',
  Country.spain: 'spain',
  Country.sweden: 'sweden',
  Country.switzerland: 'switzerland',
  Country.taiwan: 'taiwan',
  Country.thailand: 'thailand',
  Country.tunisia: 'tunisia',
  Country.turkey: 'turkey',
  Country.uae: 'uae',
  Country.gganda: 'gganda',
  Country.uK: 'uK',
  Country.ukraine: 'ukraine',
  Country.usa: 'usa',
  Country.vietnam: 'vietnam',
  Country.brazil: 'brazil',
  Country.norway: 'norway',
  Country.oman: 'oman',
  Country.ecuador: 'ecuador',
  Country.elSalvador: 'elSalvador',
  Country.sriLanka: 'sriLanka',
  Country.peru: 'peru',
  Country.uruguay: 'uruguay',
  Country.bahamas: 'bahamas',
  Country.bermuda: 'bermuda',
  Country.bolivia: 'bolivia',
  Country.china: 'china',
  Country.europeanUnion: 'europeanUnion',
  Country.haiti: 'haiti',
  Country.honduras: 'honduras',
  Country.iceland: 'iceland',
  Country.japan: 'japan',
  Country.luxembourg: 'luxembourg',
  Country.montenegro: 'montenegro',
  Country.nicaragua: 'nicaragua',
  Country.southKorea: 'southKorea',
  Country.venezuela: 'venezuela',
  Country.afghanistan: 'afghanistan',
  Country.alandIslands: 'alandIslands',
  Country.americanSamoa: 'americanSamoa',
  Country.andorra: 'andorra',
  Country.angola: 'angola',
  Country.anguilla: 'anguilla',
  Country.antarctica: 'antarctica',
  Country.antiguaAndBarbuda: 'antiguaAndBarbuda',
  Country.armenia: 'armenia',
  Country.aruba: 'aruba',
  Country.bailiwickOfGuernsey: 'bailiwickOfGuernsey',
  Country.bailiwickOfJersey: 'bailiwickOfJersey',
  Country.barbados: 'barbados',
  Country.belarus: 'belarus',
  Country.belize: 'belize',
  Country.benin: 'benin',
  Country.bhutan: 'bhutan',
  Country.bonaireSaintEustatiusAndSaba: 'bonaireSaintEustatiusAndSaba',
  Country.botswana: 'botswana',
  Country.bouvetIsland: 'bouvetIsland',
  Country.britishIndianOceanTerritory: 'britishIndianOceanTerritory',
  Country.burkinaFaso: 'burkinaFaso',
  Country.burundi: 'burundi',
  Country.cameroon: 'cameroon',
  Country.capeVerde: 'capeVerde',
  Country.caribbeanNetherlands: 'caribbeanNetherlands',
  Country.caymanIslands: 'caymanIslands',
  Country.centralAfricanRepublic: 'centralAfricanRepublic',
  Country.chad: 'chad',
  Country.christmasIsland: 'christmasIsland',
  Country.cocosIslands: 'cocosIslands',
  Country.comoros: 'comoros',
  Country.congo: 'congo',
  Country.cookIslands: 'cookIslands',
  Country.cuba: 'cuba',
  Country.curacao: 'curacao',
  Country.democraticRepublicOfTheCongo: 'democraticRepublicOfTheCongo',
  Country.djibouti: 'djibouti',
  Country.dominica: 'dominica',
  Country.eastTimor: 'eastTimor',
  Country.equatorialGuinea: 'equatorialGuinea',
  Country.eritrea: 'eritrea',
  Country.ethiopia: 'ethiopia',
  Country.falklandIslands: 'falklandIslands',
  Country.faroeIslands: 'faroeIslands',
  Country.federatedStatesOfMicronesia: 'federatedStatesOfMicronesia',
  Country.fiji: 'fiji',
  Country.frenchGuiana: 'frenchGuiana',
  Country.frenchPolynesia: 'frenchPolynesia',
  Country.frenchSouthernTerritories: 'frenchSouthernTerritories',
  Country.gabon: 'gabon',
  Country.gambia: 'gambia',
  Country.gibraltar: 'gibraltar',
  Country.greenland: 'greenland',
  Country.grenada: 'grenada',
  Country.guadeloupe: 'guadeloupe',
  Country.guam: 'guam',
  Country.guinea: 'guinea',
  Country.guineaBissau: 'guineaBissau',
  Country.guyana: 'guyana',
  Country.heardIslandAndMcdonaldIslands: 'heardIslandAndMcdonaldIslands',
  Country.iran: 'iran',
  Country.iraq: 'iraq',
  Country.isleOfMan: 'isleOfMan',
  Country.ivoryCoast: 'ivoryCoast',
  Country.jamaica: 'jamaica',
  Country.kiribati: 'kiribati',
  Country.kyrgyzstan: 'kyrgyzstan',
  Country.laos: 'laos',
  Country.lebanon: 'lebanon',
  Country.lesotho: 'lesotho',
  Country.liberia: 'liberia',
  Country.libya: 'libya',
  Country.liechtenstein: 'liechtenstein',
  Country.macau: 'macau',
  Country.madagascar: 'madagascar',
  Country.malawi: 'malawi',
  Country.mali: 'mali',
  Country.marshallIslands: 'marshallIslands',
  Country.martinique: 'martinique',
  Country.mauritania: 'mauritania',
  Country.mayotte: 'mayotte',
  Country.moldova: 'moldova',
  Country.monaco: 'monaco',
  Country.mongolia: 'mongolia',
  Country.montserrat: 'montserrat',
  Country.mozambique: 'mozambique',
  Country.myanmar: 'myanmar',
  Country.namibia: 'namibia',
  Country.nauru: 'nauru',
  Country.nepal: 'nepal',
  Country.newCaledonia: 'newCaledonia',
  Country.niger: 'niger',
  Country.niue: 'niue',
  Country.norfolkIsland: 'norfolkIsland',
  Country.northernCyprus: 'northernCyprus',
  Country.northernMarianaIslands: 'northernMarianaIslands',
  Country.northKorea: 'northKorea',
  Country.northMacedonia: 'northMacedonia',
  Country.palau: 'palau',
  Country.palestine: 'palestine',
  Country.papuaNewGuinea: 'papuaNewGuinea',
  Country.pitcairn: 'pitcairn',
  Country.reunion: 'reunion',
  Country.rwanda: 'rwanda',
  Country.saintBarthelemy: 'saintBarthelemy',
  Country.saintHelenaAscensionAndTristianDaCunha:
      'saintHelenaAscensionAndTristianDaCunha',
  Country.saintKittsAndNevis: 'saintKittsAndNevis',
  Country.saintLucia: 'saintLucia',
  Country.saintMartin: 'saintMartin',
  Country.saintPierreAndMiquelon: 'saintPierreAndMiquelon',
  Country.saintVincentAndTheGrenadines: 'saintVincentAndTheGrenadines',
  Country.samoa: 'samoa',
  Country.sanMarino: 'sanMarino',
  Country.saoTomeAndPrincipe: 'saoTomeAndPrincipe',
  Country.senegal: 'senegal',
  Country.seychelles: 'seychelles',
  Country.sierraLeone: 'sierraLeone',
  Country.sintMaarten: 'sintMaarten',
  Country.solomonIslands: 'solomonIslands',
  Country.somalia: 'somalia',
  Country.southGeorgiaAndTheSouthSandwichIslands:
      'southGeorgiaAndTheSouthSandwichIslands',
  Country.southSudan: 'southSudan',
  Country.sudan: 'sudan',
  Country.suriname: 'suriname',
  Country.svalbardAndJanMayen: 'svalbardAndJanMayen',
  Country.eswatini: 'eswatini',
  Country.syria: 'syria',
  Country.tajikistan: 'tajikistan',
  Country.tanzania: 'tanzania',
  Country.togo: 'togo',
  Country.tokelau: 'tokelau',
  Country.tonga: 'tonga',
  Country.trinidadAndTobago: 'trinidadAndTobago',
  Country.turkmenistan: 'turkmenistan',
  Country.turksAndCaicosIslands: 'turksAndCaicosIslands',
  Country.tuvalu: 'tuvalu',
  Country.unitedStatesMinorOutlyingIslands: 'unitedStatesMinorOutlyingIslands',
  Country.uzbekistan: 'uzbekistan',
  Country.vanuatu: 'vanuatu',
  Country.vaticanCity: 'vaticanCity',
  Country.virginIslandsBritish: 'virginIslandsBritish',
  Country.virginIslandsUs: 'virginIslandsUs',
  Country.wallisAndFutuna: 'wallisAndFutuna',
  Country.westernSahara: 'westernSahara',
  Country.yemen: 'yemen',
  Country.yugoslavia: 'yugoslavia',
  Country.zambia: 'zambia',
  Country.zimbabwe: 'zimbabwe',
  Country.schengenArea: 'schengenArea',
};

const _$RegionEnumMap = {
  Region.none: 'none',
  Region.alabama: 'alabama',
  Region.alaska: 'alaska',
  Region.alberta: 'alberta',
  Region.arizona: 'arizona',
  Region.arkansas: 'arkansas',
  Region.australianCapitalTerritory: 'australianCapitalTerritory',
  Region.britishColumbia: 'britishColumbia',
  Region.california: 'california',
  Region.colorado: 'colorado',
  Region.connecticut: 'connecticut',
  Region.delaware: 'delaware',
  Region.districtOfColumbia: 'districtOfColumbia',
  Region.florida: 'florida',
  Region.georgia: 'georgia',
  Region.hawaii: 'hawaii',
  Region.idaho: 'idaho',
  Region.illinois: 'illinois',
  Region.indiana: 'indiana',
  Region.iowa: 'iowa',
  Region.kansas: 'kansas',
  Region.kentucky: 'kentucky',
  Region.louisiana: 'louisiana',
  Region.maine: 'maine',
  Region.manitoba: 'manitoba',
  Region.maryland: 'maryland',
  Region.massachusetts: 'massachusetts',
  Region.michigan: 'michigan',
  Region.minnesota: 'minnesota',
  Region.mississippi: 'mississippi',
  Region.missouri: 'missouri',
  Region.montana: 'montana',
  Region.nebraska: 'nebraska',
  Region.nevada: 'nevada',
  Region.newBrunswick: 'newBrunswick',
  Region.newHampshire: 'newHampshire',
  Region.newJersey: 'newJersey',
  Region.newMexico: 'newMexico',
  Region.newSouthWales: 'newSouthWales',
  Region.newYork: 'newYork',
  Region.northernTerritory: 'northernTerritory',
  Region.northCarolina: 'northCarolina',
  Region.northDakota: 'northDakota',
  Region.novaScotia: 'novaScotia',
  Region.ohio: 'ohio',
  Region.oklahoma: 'oklahoma',
  Region.ontario: 'ontario',
  Region.oregon: 'oregon',
  Region.pennsylvania: 'pennsylvania',
  Region.quebec: 'quebec',
  Region.queensland: 'queensland',
  Region.rhodeIsland: 'rhodeIsland',
  Region.saskatchewan: 'saskatchewan',
  Region.southAustralia: 'southAustralia',
  Region.southCarolina: 'southCarolina',
  Region.southDakota: 'southDakota',
  Region.tasmania: 'tasmania',
  Region.tennessee: 'tennessee',
  Region.texas: 'texas',
  Region.utah: 'utah',
  Region.vermont: 'vermont',
  Region.victoria: 'victoria',
  Region.virginia: 'virginia',
  Region.washington: 'washington',
  Region.westernAustralia: 'westernAustralia',
  Region.westVirginia: 'westVirginia',
  Region.wisconsin: 'wisconsin',
  Region.wyoming: 'wyoming',
  Region.yukon: 'yukon',
  Region.ciudadDeMexico: 'ciudadDeMexico',
  Region.jalisco: 'jalisco',
  Region.newfoundlandAndLabrador: 'newfoundlandAndLabrador',
  Region.nuevoLeon: 'nuevoLeon',
  Region.bajaCalifornia: 'bajaCalifornia',
  Region.chihuahua: 'chihuahua',
  Region.guanajuato: 'guanajuato',
  Region.guerrero: 'guerrero',
  Region.mexico: 'mexico',
  Region.michoacan: 'michoacan',
  Region.newYorkCity: 'newYorkCity',
  Region.tamaulipas: 'tamaulipas',
  Region.veracruz: 'veracruz',
  Region.chiapas: 'chiapas',
  Region.coahuila: 'coahuila',
  Region.durango: 'durango',
  Region.guerreroCocula: 'guerreroCocula',
  Region.guerreroJuchitan: 'guerreroJuchitan',
  Region.guerreroTepecoacuilco: 'guerreroTepecoacuilco',
  Region.guerreroTlacoapa: 'guerreroTlacoapa',
  Region.gujarat: 'gujarat',
  Region.hidalgo: 'hidalgo',
  Region.karnataka: 'karnataka',
  Region.kerala: 'kerala',
  Region.khyberPakhtunkhwa: 'khyberPakhtunkhwa',
  Region.madhyaPradesh: 'madhyaPradesh',
  Region.maharashtra: 'maharashtra',
  Region.morelos: 'morelos',
  Region.nayarit: 'nayarit',
  Region.oaxaca: 'oaxaca',
  Region.puebla: 'puebla',
  Region.punjab: 'punjab',
  Region.queretaro: 'queretaro',
  Region.sanLuisPotosi: 'sanLuisPotosi',
  Region.sinaloa: 'sinaloa',
  Region.sonora: 'sonora',
  Region.tabasco: 'tabasco',
  Region.tamilNadu: 'tamilNadu',
  Region.yucatan: 'yucatan',
  Region.zacatecas: 'zacatecas',
  Region.aguascalientes: 'aguascalientes',
  Region.bajaCaliforniaSur: 'bajaCaliforniaSur',
  Region.campeche: 'campeche',
  Region.colima: 'colima',
  Region.quintanaRooBenitoJuarez: 'quintanaRooBenitoJuarez',
  Region.quintanaRoo: 'quintanaRoo',
  Region.quintanaRooSolidaridad: 'quintanaRooSolidaridad',
  Region.tlaxcala: 'tlaxcala',
  Region.quintanaRooCozumel: 'quintanaRooCozumel',
  Region.saoPaolo: 'saoPaolo',
  Region.rioDeJaneiro: 'rioDeJaneiro',
  Region.rioGrandeDoSul: 'rioGrandeDoSul',
  Region.northWestTerritories: 'northWestTerritories',
  Region.nunavut: 'nunavut',
  Region.princeEdwardIsland: 'princeEdwardIsland',
  Region.distritoFederal: 'distritoFederal',
  Region.maranhao: 'maranhao',
  Region.matoGrosso: 'matoGrosso',
  Region.minasGerais: 'minasGerais',
  Region.para: 'para',
  Region.parana: 'parana',
  Region.pernambuco: 'pernambuco',
  Region.santaCatarina: 'santaCatarina',
  Region.andhraPradesh: 'andhraPradesh',
  Region.ceara: 'ceara',
  Region.goias: 'goias',
  Region.guerreroAcapulcoDeJuarez: 'guerreroAcapulcoDeJuarez',
  Region.haryana: 'haryana',
  Region.sergipe: 'sergipe',
  Region.alagos: 'alagos',
  Region.bangsamoro: 'bangsamoro',
};

const _$DocumentTypeEnumMap = {
  DocumentType.none: 'none',
  DocumentType.consularId: 'consularId',
  DocumentType.dl: 'dl',
  DocumentType.dlPublicServicesCard: 'dlPublicServicesCard',
  DocumentType.employmentPass: 'employmentPass',
  DocumentType.finCard: 'finCard',
  DocumentType.id: 'id',
  DocumentType.multipurposeId: 'multipurposeId',
  DocumentType.myKad: 'myKad',
  DocumentType.myKid: 'myKid',
  DocumentType.myPR: 'myPR',
  DocumentType.myTentera: 'myTentera',
  DocumentType.panCard: 'panCard',
  DocumentType.professionalId: 'professionalId',
  DocumentType.publicServicesCard: 'publicServicesCard',
  DocumentType.residencePermit: 'residencePermit',
  DocumentType.residentId: 'residentId',
  DocumentType.temporaryResidencePermit: 'temporaryResidencePermit',
  DocumentType.voterId: 'voterId',
  DocumentType.workPermit: 'workPermit',
  DocumentType.iKad: 'iKad',
  DocumentType.militaryId: 'militaryId',
  DocumentType.myKas: 'myKas',
  DocumentType.docialSecurityCard: 'docialSecurityCard',
  DocumentType.healthInsuranceCard: 'healthInsuranceCard',
  DocumentType.passport: 'passport',
  DocumentType.sPass: 'sPass',
  DocumentType.addressCard: 'addressCard',
  DocumentType.alienId: 'alienId',
  DocumentType.alienPassport: 'alienPassport',
  DocumentType.greenCard: 'greenCard',
  DocumentType.minorsId: 'minorsId',
  DocumentType.postalId: 'postalId',
  DocumentType.professionalDl: 'professionalDl',
  DocumentType.taxId: 'taxId',
  DocumentType.weaponPermit: 'weaponPermit',
  DocumentType.visa: 'visa',
  DocumentType.borderCrossingCard: 'borderCrossingCard',
  DocumentType.driverCard: 'driverCard',
  DocumentType.globalEntryCard: 'globalEntryCard',
  DocumentType.mypolis: 'mypolis',
  DocumentType.nexusCard: 'nexusCard',
  DocumentType.passportCard: 'passportCard',
  DocumentType.proofOfAgeCard: 'proofOfAgeCard',
  DocumentType.refugeeId: 'refugeeId',
  DocumentType.tribalId: 'tribalId',
  DocumentType.veteranId: 'veteranId',
  DocumentType.citizenshipCertificate: 'citizenshipCertificate',
  DocumentType.myNumberCard: 'myNumberCard',
  DocumentType.consularPassport: 'consularPassport',
  DocumentType.minorsPassport: 'minorsPassport',
  DocumentType.minorsPublicServicesCard: 'minorsPublicServicesCard',
  DocumentType.drivingPriviligeCard: 'drivingPriviligeCard',
  DocumentType.asylumRequest: 'asylumRequest',
  DocumentType.driverQualificationCard: 'driverQualificationCard',
  DocumentType.provisionalDl: 'provisionalDl',
  DocumentType.refugeePassport: 'refugeePassport',
  DocumentType.specialId: 'specialId',
  DocumentType.uniformedServicesId: 'uniformedServicesId',
  DocumentType.immigrantVisa: 'immigrantVisa',
  DocumentType.consularVoterId: 'consularVoterId',
  DocumentType.twicCard: 'twicCard',
  DocumentType.exitEntryPermit: 'exitEntryPermit',
  DocumentType.mainlandTravelPermitTaiwan: 'mainlandTravelPermitTaiwan',
  DocumentType.nbiClearance: 'nbiClearance',
  DocumentType.proofOfRegistration: 'proofOfRegistration',
  DocumentType.temporaryProtectionPermit: 'temporaryProtectionPermit',
  DocumentType.afghanCitizenCard: 'afghanCitizenCard',
  DocumentType.eId: 'eId',
  DocumentType.pass: 'pass',
  DocumentType.sisId: 'sisId',
  DocumentType.asicCard: 'asicCard',
  DocumentType.bidoonCard: 'bidoonCard',
  DocumentType.interimHealthInsuranceCard: 'interimHealthInsuranceCard',
  DocumentType.nonVoterId: 'nonVoterId',
  DocumentType.reciprocalHealthInsuranceCard: 'reciprocalHealthInsuranceCard',
  DocumentType.vehicleRegistration: 'vehicleRegistration',
  DocumentType.esaadCard: 'esaadCard',
  DocumentType.registrationCertificate: 'registrationCertificate',
  DocumentType.medicalMarijuanaId: 'medicalMarijuanaId',
};

DocumentNumberAnonymizationSettings
_$DocumentNumberAnonymizationSettingsFromJson(Map<String, dynamic> json) =>
    DocumentNumberAnonymizationSettings(
      (json['prefixDigitsVisible'] as num?)?.toInt(),
      (json['suffixDigitsVisible'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DocumentNumberAnonymizationSettingsToJson(
  DocumentNumberAnonymizationSettings instance,
) => <String, dynamic>{
  'prefixDigitsVisible': instance.prefixDigitsVisible,
  'suffixDigitsVisible': instance.suffixDigitsVisible,
};

RecognitionModeFilter _$RecognitionModeFilterFromJson(
  Map<String, dynamic> json,
) =>
    RecognitionModeFilter()
      ..enableMrzId = json['enableMrzId'] as bool
      ..enableMrzVisa = json['enableMrzVisa'] as bool
      ..enableMrzPassport = json['enableMrzPassport'] as bool
      ..enablePhotoId = json['enablePhotoId'] as bool
      ..enableBarcodeId = json['enableBarcodeId'] as bool
      ..enableFullDocumentRecognition =
          json['enableFullDocumentRecognition'] as bool;

Map<String, dynamic> _$RecognitionModeFilterToJson(
  RecognitionModeFilter instance,
) => <String, dynamic>{
  'enableMrzId': instance.enableMrzId,
  'enableMrzVisa': instance.enableMrzVisa,
  'enableMrzPassport': instance.enableMrzPassport,
  'enablePhotoId': instance.enablePhotoId,
  'enableBarcodeId': instance.enableBarcodeId,
  'enableFullDocumentRecognition': instance.enableFullDocumentRecognition,
};

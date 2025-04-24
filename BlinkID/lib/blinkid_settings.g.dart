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
      (json['detailedFieldTypes'] as List<dynamic>?)
          ?.map((e) => DetailedFieldType.fromJson(e as Map<String, dynamic>))
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
      'detailedFieldTypes': instance.detailedFieldTypes,
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
  FieldType.AdditionalAddressInformation: 0,
  FieldType.AdditionalNameInformation: 1,
  FieldType.AdditionalOptionalAddressInformation: 2,
  FieldType.AdditionalPersonalIdNumber: 3,
  FieldType.Address: 4,
  FieldType.ClassEffectiveDate: 5,
  FieldType.ClassExpiryDate: 6,
  FieldType.Conditions: 7,
  FieldType.DateOfBirth: 8,
  FieldType.DateOfExpiry: 9,
  FieldType.DateOfIssue: 10,
  FieldType.DocumentAdditionalNumber: 11,
  FieldType.DocumentOptionalAdditionalNumber: 12,
  FieldType.DocumentNumber: 13,
  FieldType.Employer: 14,
  FieldType.Endorsements: 15,
  FieldType.FathersName: 16,
  FieldType.FirstName: 17,
  FieldType.FullName: 18,
  FieldType.IssuingAuthority: 19,
  FieldType.LastName: 20,
  FieldType.LicenceType: 21,
  FieldType.LocalizedName: 22,
  FieldType.MaritalStatus: 23,
  FieldType.MothersName: 24,
  FieldType.Mrz: 25,
  FieldType.Nationality: 26,
  FieldType.PersonalIdNumber: 27,
  FieldType.PlaceOfBirth: 28,
  FieldType.Profession: 29,
  FieldType.Race: 30,
  FieldType.Religion: 31,
  FieldType.ResidentialStatus: 32,
  FieldType.Restrictions: 33,
  FieldType.Sex: 34,
  FieldType.VehicleClass: 35,
  FieldType.BloodType: 36,
  FieldType.Sponsor: 37,
  FieldType.VisaType: 38,
  FieldType.DocumentSubtype: 39,
  FieldType.Remarks: 40,
  FieldType.ResidencePermitType: 41,
  FieldType.ManufacturingYear: 42,
  FieldType.VehicleType: 43,
  FieldType.DependentDateOfBirth: 44,
  FieldType.DependentSex: 45,
  FieldType.DependentDocumentNumber: 46,
  FieldType.DependentFullName: 47,
  FieldType.EligibilityCategory: 48,
  FieldType.SpecificDocumentValidity: 49,
  FieldType.VehicleOwner: 50,
};

const _$AlphabetTypeEnumMap = {
  AlphabetType.latin: 0,
  AlphabetType.arabic: 1,
  AlphabetType.cyrillic: 2,
  AlphabetType.greek: 3,
};

DocumentAnonymizationSettings _$DocumentAnonymizationSettingsFromJson(
  Map<String, dynamic> json,
) =>
    DocumentAnonymizationSettings(
        (json['fields'] as List<dynamic>)
            .map((e) => $enumDecode(_$FieldTypeEnumMap, e))
            .toList(),
      )
      ..documentFilter =
          json['documentFilter'] == null
              ? null
              : DocumentFilter.fromJson(
                json['documentFilter'] as Map<String, dynamic>,
              )
      ..documentNumberAnonymizationSettings =
          json['documentNumberAnonymizationSettings'] == null
              ? null
              : DocumentNumberAnonymizationSettings.fromJson(
                json['documentNumberAnonymizationSettings']
                    as Map<String, dynamic>,
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
    DocumentFilter()
      ..country = $enumDecodeNullable(_$CountryEnumMap, json['country'])
      ..region = $enumDecodeNullable(_$RegionEnumMap, json['region'])
      ..documentType = $enumDecodeNullable(
        _$DocumentTypeEnumMap,
        json['documentType'],
      );

Map<String, dynamic> _$DocumentFilterToJson(DocumentFilter instance) =>
    <String, dynamic>{
      'country': _$CountryEnumMap[instance.country],
      'region': _$RegionEnumMap[instance.region],
      'documentType': _$DocumentTypeEnumMap[instance.documentType],
    };

const _$CountryEnumMap = {
  Country.none: 0,
  Country.albania: 1,
  Country.algeria: 2,
  Country.argentina: 3,
  Country.australia: 4,
  Country.austria: 5,
  Country.azerbaijan: 6,
  Country.bahrain: 7,
  Country.bangladesh: 8,
  Country.belgium: 9,
  Country.bosniaAndHerzegovina: 10,
  Country.brunei: 11,
  Country.bulgaria: 12,
  Country.bambodia: 13,
  Country.canada: 14,
  Country.chile: 15,
  Country.colombia: 16,
  Country.costaRica: 17,
  Country.croatia: 18,
  Country.cyprus: 19,
  Country.czechia: 20,
  Country.denmark: 21,
  Country.dominicanRepublic: 22,
  Country.egypt: 23,
  Country.estonia: 24,
  Country.finland: 25,
  Country.france: 26,
  Country.georgia: 27,
  Country.germany: 28,
  Country.ghana: 29,
  Country.greece: 30,
  Country.guatemala: 31,
  Country.hongKong: 32,
  Country.hungary: 33,
  Country.india: 34,
  Country.indonesia: 35,
  Country.ireland: 36,
  Country.israel: 37,
  Country.italy: 38,
  Country.jordan: 39,
  Country.kazakhstan: 40,
  Country.kenya: 41,
  Country.kosovo: 42,
  Country.kuwait: 43,
  Country.latvia: 44,
  Country.lithuania: 45,
  Country.malaysia: 46,
  Country.maldives: 47,
  Country.malta: 48,
  Country.mauritius: 49,
  Country.mexico: 50,
  Country.morocco: 51,
  Country.netherlands: 52,
  Country.newZealand: 53,
  Country.nigeria: 54,
  Country.pakistan: 55,
  Country.panama: 56,
  Country.paraguay: 57,
  Country.philippines: 58,
  Country.poland: 59,
  Country.portugal: 60,
  Country.puertoRico: 61,
  Country.qatar: 62,
  Country.romania: 63,
  Country.russia: 64,
  Country.saudiArabia: 65,
  Country.serbia: 66,
  Country.singapore: 67,
  Country.slovakia: 68,
  Country.slovenia: 69,
  Country.southAfrica: 70,
  Country.spain: 71,
  Country.sweden: 72,
  Country.switzerland: 73,
  Country.taiwan: 74,
  Country.thailand: 75,
  Country.tunisia: 76,
  Country.turkey: 77,
  Country.uae: 78,
  Country.gganda: 79,
  Country.uK: 80,
  Country.ukraine: 81,
  Country.usa: 82,
  Country.vietnam: 83,
  Country.brazil: 84,
  Country.norway: 85,
  Country.oman: 86,
  Country.ecuador: 87,
  Country.elSalvador: 88,
  Country.sriLanka: 89,
  Country.peru: 90,
  Country.uruguay: 91,
  Country.bahamas: 92,
  Country.bermuda: 93,
  Country.bolivia: 94,
  Country.china: 95,
  Country.europeanUnion: 96,
  Country.haiti: 97,
  Country.honduras: 98,
  Country.iceland: 99,
  Country.japan: 100,
  Country.luxembourg: 101,
  Country.montenegro: 102,
  Country.nicaragua: 103,
  Country.southKorea: 104,
  Country.venezuela: 105,
  Country.afghanistan: 106,
  Country.alandIslands: 107,
  Country.americanSamoa: 108,
  Country.andorra: 109,
  Country.angola: 110,
  Country.anguilla: 111,
  Country.antarctica: 112,
  Country.antiguaAndBarbuda: 113,
  Country.armenia: 114,
  Country.aruba: 115,
  Country.bailiwickOfGuernsey: 116,
  Country.bailiwickOfJersey: 117,
  Country.barbados: 118,
  Country.belarus: 119,
  Country.belize: 120,
  Country.benin: 121,
  Country.bhutan: 122,
  Country.bonaireSaintEustatiusAndSaba: 123,
  Country.botswana: 124,
  Country.bouvetIsland: 125,
  Country.britishIndianOceanTerritory: 126,
  Country.burkinaFaso: 127,
  Country.burundi: 128,
  Country.cameroon: 129,
  Country.capeVerde: 130,
  Country.caribbeanNetherlands: 131,
  Country.caymanIslands: 132,
  Country.centralAfricanRepublic: 133,
  Country.chad: 134,
  Country.christmasIsland: 135,
  Country.cocosIslands: 136,
  Country.comoros: 137,
  Country.congo: 138,
  Country.cookIslands: 139,
  Country.cuba: 140,
  Country.curacao: 141,
  Country.democraticRepublicOfTheCongo: 142,
  Country.djibouti: 143,
  Country.dominica: 144,
  Country.eastTimor: 145,
  Country.equatorialGuinea: 146,
  Country.eritrea: 147,
  Country.ethiopia: 148,
  Country.falklandIslands: 149,
  Country.faroeIslands: 150,
  Country.federatedStatesOfMicronesia: 151,
  Country.fiji: 152,
  Country.frenchGuiana: 153,
  Country.frenchPolynesia: 154,
  Country.frenchSouthernTerritories: 155,
  Country.gabon: 156,
  Country.gambia: 157,
  Country.gibraltar: 158,
  Country.greenland: 159,
  Country.grenada: 160,
  Country.guadeloupe: 161,
  Country.guam: 162,
  Country.guinea: 163,
  Country.guineaBissau: 164,
  Country.guyana: 165,
  Country.heardIslandAndMcdonaldIslands: 166,
  Country.iran: 167,
  Country.iraq: 168,
  Country.isleOfMan: 169,
  Country.ivoryCoast: 170,
  Country.jamaica: 171,
  Country.kiribati: 172,
  Country.kyrgyzstan: 173,
  Country.laos: 183,
  Country.lebanon: 184,
  Country.lesotho: 185,
  Country.liberia: 186,
  Country.libya: 187,
  Country.liechtenstein: 188,
  Country.macau: 189,
  Country.madagascar: 190,
  Country.malawi: 191,
  Country.mali: 192,
  Country.marshallIslands: 193,
  Country.martinique: 194,
  Country.mauritania: 195,
  Country.mayotte: 196,
  Country.moldova: 197,
  Country.monaco: 198,
  Country.mongolia: 199,
  Country.montserrat: 200,
  Country.mozambique: 201,
  Country.myanmar: 202,
  Country.namibia: 203,
  Country.nauru: 204,
  Country.nepal: 205,
  Country.newCaledonia: 206,
  Country.niger: 207,
  Country.niue: 208,
  Country.norfolkIsland: 209,
  Country.northernCyprus: 210,
  Country.northernMarianaIslands: 211,
  Country.northKorea: 212,
  Country.northMacedonia: 213,
  Country.palau: 214,
  Country.palestine: 215,
  Country.papuaNewGuinea: 216,
  Country.pitcairn: 217,
  Country.reunion: 218,
  Country.rwanda: 219,
  Country.saintBarthelemy: 220,
  Country.saintHelenaAscensionAndTristianDaCunha: 221,
  Country.saintKittsAndNevis: 222,
  Country.saintLucia: 223,
  Country.saintMartin: 224,
  Country.saintPierreAndMiquelon: 225,
  Country.saintVincentAndTheGrenadines: 226,
  Country.samoa: 227,
  Country.sanMarino: 228,
  Country.saoTomeAndPrincipe: 229,
  Country.senegal: 230,
  Country.seychelles: 231,
  Country.sierraLeone: 232,
  Country.sintMaarten: 233,
  Country.solomonIslands: 234,
  Country.somalia: 235,
  Country.southGeorgiaAndTheSouthSandwichIslands: 236,
  Country.southSudan: 237,
  Country.sudan: 238,
  Country.suriname: 239,
  Country.svalbardAndJanMayen: 240,
  Country.eswatini: 241,
  Country.syria: 242,
  Country.tajikistan: 243,
  Country.tanzania: 244,
  Country.togo: 245,
  Country.tokelau: 246,
  Country.tonga: 247,
  Country.trinidadAndTobago: 248,
  Country.turkmenistan: 249,
  Country.turksAndCaicosIslands: 250,
  Country.tuvalu: 251,
  Country.unitedStatesMinorOutlyingIslands: 252,
  Country.uzbekistan: 253,
  Country.vanuatu: 254,
  Country.vaticanCity: 255,
  Country.virginIslandsBritish: 256,
  Country.virginIslandsUs: 257,
  Country.wallisAndFutuna: 258,
  Country.westernSahara: 259,
  Country.yemen: 260,
  Country.yugoslavia: 261,
  Country.zambia: 262,
  Country.zimbabwe: 263,
  Country.schengenArea: 264,
};

const _$RegionEnumMap = {
  Region.None: 0,
  Region.Alabama: 1,
  Region.Alaska: 2,
  Region.Alberta: 3,
  Region.Arizona: 4,
  Region.Arkansas: 5,
  Region.AustralianCapitalTerritory: 6,
  Region.BritishColumbia: 7,
  Region.California: 8,
  Region.Colorado: 9,
  Region.Connecticut: 10,
  Region.Delaware: 11,
  Region.DistrictOfColumbia: 12,
  Region.Florida: 13,
  Region.Georgia: 14,
  Region.Hawaii: 15,
  Region.Idaho: 16,
  Region.Illinois: 17,
  Region.Indiana: 18,
  Region.Iowa: 19,
  Region.Kansas: 20,
  Region.Kentucky: 21,
  Region.Louisiana: 22,
  Region.Maine: 23,
  Region.Manitoba: 24,
  Region.Maryland: 25,
  Region.Massachusetts: 26,
  Region.Michigan: 27,
  Region.Minnesota: 28,
  Region.Mississippi: 29,
  Region.Missouri: 30,
  Region.Montana: 31,
  Region.Nebraska: 32,
  Region.Nevada: 33,
  Region.NewBrunswick: 34,
  Region.NewHampshire: 35,
  Region.NewJersey: 36,
  Region.NewMexico: 37,
  Region.NewSouthWales: 38,
  Region.NewYork: 39,
  Region.NorthernTerritory: 40,
  Region.NorthCarolina: 41,
  Region.NorthDakota: 42,
  Region.NovaScotia: 43,
  Region.Ohio: 44,
  Region.Oklahoma: 45,
  Region.Ontario: 46,
  Region.Oregon: 47,
  Region.Pennsylvania: 48,
  Region.Quebec: 49,
  Region.Queensland: 50,
  Region.RhodeIsland: 51,
  Region.Saskatchewan: 52,
  Region.SouthAustralia: 53,
  Region.SouthCarolina: 54,
  Region.SouthDakota: 55,
  Region.Tasmania: 56,
  Region.Tennessee: 57,
  Region.Texas: 58,
  Region.Utah: 59,
  Region.Vermont: 60,
  Region.Victoria: 61,
  Region.Virginia: 62,
  Region.Washington: 63,
  Region.WesternAustralia: 64,
  Region.WestVirginia: 65,
  Region.Wisconsin: 66,
  Region.Wyoming: 67,
  Region.Yukon: 68,
  Region.CiudadDeMexico: 69,
  Region.Jalisco: 70,
  Region.NewfoundlandAndLabrador: 71,
  Region.NuevoLeon: 72,
  Region.BajaCalifornia: 73,
  Region.Chihuahua: 74,
  Region.Guanajuato: 75,
  Region.Guerrero: 76,
  Region.Mexico: 77,
  Region.Michoacan: 78,
  Region.NewYorkCity: 79,
  Region.Tamaulipas: 80,
  Region.Veracruz: 81,
  Region.Chiapas: 82,
  Region.Coahuila: 83,
  Region.Durango: 84,
  Region.GuerreroCocula: 85,
  Region.GuerreroJuchitan: 86,
  Region.GuerreroTepecoacuilco: 87,
  Region.GuerreroTlacoapa: 88,
  Region.Gujarat: 89,
  Region.Hidalgo: 90,
  Region.Karnataka: 91,
  Region.Kerala: 92,
  Region.KhyberPakhtunkhwa: 93,
  Region.MadhyaPradesh: 94,
  Region.Maharashtra: 95,
  Region.Morelos: 96,
  Region.Nayarit: 97,
  Region.Oaxaca: 98,
  Region.Puebla: 99,
  Region.Punjab: 100,
  Region.Queretaro: 101,
  Region.SanLuisPotosi: 102,
  Region.Sinaloa: 103,
  Region.Sonora: 104,
  Region.Tabasco: 105,
  Region.TamilNadu: 106,
  Region.Yucatan: 107,
  Region.Zacatecas: 108,
  Region.Aguascalientes: 109,
  Region.BajaCaliforniaSur: 110,
  Region.Campeche: 111,
  Region.Colima: 112,
  Region.QuintanaRooBenitoJuarez: 113,
  Region.QuintanaRoo: 114,
  Region.QuintanaRooSolidaridad: 115,
  Region.Tlaxcala: 116,
  Region.QuintanaRooCozumel: 117,
  Region.SaoPaolo: 118,
  Region.RioDeJaneiro: 119,
  Region.RioGrandeDoSul: 120,
  Region.NorthWestTerritories: 121,
  Region.Nunavut: 122,
  Region.PrinceEdwardIsland: 123,
  Region.DistritoFederal: 124,
  Region.Maranhao: 125,
  Region.MatoGrosso: 126,
  Region.MinasGerais: 127,
  Region.Para: 128,
  Region.Parana: 129,
  Region.Pernambuco: 130,
  Region.SantaCatarina: 131,
  Region.AndhraPradesh: 132,
  Region.Ceara: 133,
  Region.Goias: 134,
  Region.GuerreroAcapulcoDeJuarez: 135,
  Region.Haryana: 136,
  Region.Sergipe: 137,
  Region.Alagos: 138,
  Region.Bangsamoro: 139,
};

const _$DocumentTypeEnumMap = {
  DocumentType.None: 0,
  DocumentType.ConsularId: 1,
  DocumentType.Dl: 2,
  DocumentType.DlPublicServicesCard: 3,
  DocumentType.EmploymentPass: 4,
  DocumentType.FinCard: 5,
  DocumentType.Id: 6,
  DocumentType.MultipurposeId: 7,
  DocumentType.MyKad: 8,
  DocumentType.MyKid: 9,
  DocumentType.MyPR: 10,
  DocumentType.MyTentera: 11,
  DocumentType.PanCard: 12,
  DocumentType.ProfessionalId: 13,
  DocumentType.PublicServicesCard: 14,
  DocumentType.ResidencePermit: 15,
  DocumentType.ResidentId: 16,
  DocumentType.TemporaryResidencePermit: 17,
  DocumentType.VoterId: 18,
  DocumentType.WorkPermit: 19,
  DocumentType.iKad: 20,
  DocumentType.MilitaryId: 21,
  DocumentType.MyKas: 22,
  DocumentType.SocialSecurityCard: 23,
  DocumentType.HealthInsuranceCard: 24,
  DocumentType.Passport: 25,
  DocumentType.SPass: 26,
  DocumentType.AddressCard: 27,
  DocumentType.AlienId: 28,
  DocumentType.AlienPassport: 29,
  DocumentType.GreenCard: 30,
  DocumentType.MinorsId: 31,
  DocumentType.PostalId: 32,
  DocumentType.ProfessionalDl: 33,
  DocumentType.TaxId: 34,
  DocumentType.WeaponPermit: 35,
  DocumentType.Visa: 36,
  DocumentType.BorderCrossingCard: 37,
  DocumentType.DriverCard: 38,
  DocumentType.GlobalEntryCard: 39,
  DocumentType.Mypolis: 40,
  DocumentType.NexusCard: 41,
  DocumentType.PassportCard: 42,
  DocumentType.ProofOfAgeCard: 43,
  DocumentType.RefugeeId: 44,
  DocumentType.TribalId: 45,
  DocumentType.VeteranId: 46,
  DocumentType.CitizenshipCertificate: 47,
  DocumentType.MyNumberCard: 48,
  DocumentType.ConsularPassport: 49,
  DocumentType.MinorsPassport: 50,
  DocumentType.MinorsPublicServicesCard: 51,
  DocumentType.DrivingPriviligeCard: 52,
  DocumentType.AsylumRequest: 53,
  DocumentType.DriverQualificationCard: 54,
  DocumentType.ProvisionalDl: 55,
  DocumentType.RefugeePassport: 56,
  DocumentType.SpecialId: 57,
  DocumentType.UniformedServicesId: 58,
  DocumentType.ImmigrantVisa: 59,
  DocumentType.ConsularVoterId: 60,
  DocumentType.TwicCard: 61,
  DocumentType.ExitEntryPermit: 62,
  DocumentType.MainlandTravelPermitTaiwan: 63,
  DocumentType.NbiClearance: 64,
  DocumentType.ProofOfRegistration: 65,
  DocumentType.TemporaryProtectionPermit: 66,
  DocumentType.AfghanCitizenCard: 67,
  DocumentType.EId: 68,
  DocumentType.Pass: 69,
  DocumentType.SisId: 70,
  DocumentType.AsicCard: 71,
  DocumentType.BidoonCard: 72,
  DocumentType.InterimHealthInsuranceCard: 73,
  DocumentType.NonVoterId: 74,
  DocumentType.ReciprocalHealthInsuranceCard: 75,
  DocumentType.VehicleRegistration: 76,
  DocumentType.EsaadCard: 77,
};

DocumentNumberAnonymizationSettings
_$DocumentNumberAnonymizationSettingsFromJson(Map<String, dynamic> json) =>
    DocumentNumberAnonymizationSettings()
      ..prefixDigitsVisible = (json['prefixDigitsVisible'] as num?)?.toInt()
      ..suffixDigitsVisible = (json['suffixDigitsVisible'] as num?)?.toInt();

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

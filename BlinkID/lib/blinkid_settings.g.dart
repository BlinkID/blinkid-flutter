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
  FieldType.additionalAddressInformation: 0,
  FieldType.additionalNameInformation: 1,
  FieldType.additionalOptionalAddressInformation: 2,
  FieldType.additionalPersonalIdNumber: 3,
  FieldType.address: 4,
  FieldType.classEffectiveDate: 5,
  FieldType.classExpiryDate: 6,
  FieldType.conditions: 7,
  FieldType.dateOfBirth: 8,
  FieldType.dateOfExpiry: 9,
  FieldType.dateOfIssue: 10,
  FieldType.documentAdditionalNumber: 11,
  FieldType.documentOptionalAdditionalNumber: 12,
  FieldType.documentNumber: 13,
  FieldType.employer: 14,
  FieldType.endorsements: 15,
  FieldType.fathersName: 16,
  FieldType.firstName: 17,
  FieldType.fullName: 18,
  FieldType.issuingAuthority: 19,
  FieldType.lastName: 20,
  FieldType.licenceType: 21,
  FieldType.localizedName: 22,
  FieldType.maritalStatus: 23,
  FieldType.mothersName: 24,
  FieldType.mrz: 25,
  FieldType.nationality: 26,
  FieldType.personalIdNumber: 27,
  FieldType.placeOfBirth: 28,
  FieldType.profession: 29,
  FieldType.race: 30,
  FieldType.religion: 31,
  FieldType.residentialStatus: 32,
  FieldType.restrictions: 33,
  FieldType.sex: 34,
  FieldType.vehicleClass: 35,
  FieldType.bloodType: 36,
  FieldType.sponsor: 37,
  FieldType.visaType: 38,
  FieldType.documentSubtype: 39,
  FieldType.remarks: 40,
  FieldType.residencePermitType: 41,
  FieldType.manufacturingYear: 42,
  FieldType.vehicleType: 43,
  FieldType.dependentDateOfBirth: 44,
  FieldType.dependentSex: 45,
  FieldType.dependentDocumentNumber: 46,
  FieldType.dependentFullName: 47,
  FieldType.eligibilityCategory: 48,
  FieldType.specificDocumentValidity: 49,
  FieldType.vehicleOwner: 50,
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
  Region.none: 0,
  Region.alabama: 1,
  Region.alaska: 2,
  Region.alberta: 3,
  Region.arizona: 4,
  Region.arkansas: 5,
  Region.australianCapitalTerritory: 6,
  Region.britishColumbia: 7,
  Region.california: 8,
  Region.colorado: 9,
  Region.connecticut: 10,
  Region.delaware: 11,
  Region.districtOfColumbia: 12,
  Region.florida: 13,
  Region.georgia: 14,
  Region.hawaii: 15,
  Region.idaho: 16,
  Region.illinois: 17,
  Region.indiana: 18,
  Region.iowa: 19,
  Region.kansas: 20,
  Region.kentucky: 21,
  Region.louisiana: 22,
  Region.maine: 23,
  Region.manitoba: 24,
  Region.maryland: 25,
  Region.massachusetts: 26,
  Region.michigan: 27,
  Region.minnesota: 28,
  Region.mississippi: 29,
  Region.missouri: 30,
  Region.montana: 31,
  Region.nebraska: 32,
  Region.nevada: 33,
  Region.newBrunswick: 34,
  Region.newHampshire: 35,
  Region.newJersey: 36,
  Region.newMexico: 37,
  Region.newSouthWales: 38,
  Region.newYork: 39,
  Region.northernTerritory: 40,
  Region.northCarolina: 41,
  Region.northDakota: 42,
  Region.novaScotia: 43,
  Region.ohio: 44,
  Region.oklahoma: 45,
  Region.ontario: 46,
  Region.oregon: 47,
  Region.pennsylvania: 48,
  Region.quebec: 49,
  Region.queensland: 50,
  Region.rhodeIsland: 51,
  Region.saskatchewan: 52,
  Region.southAustralia: 53,
  Region.southCarolina: 54,
  Region.southDakota: 55,
  Region.tasmania: 56,
  Region.tennessee: 57,
  Region.texas: 58,
  Region.utah: 59,
  Region.vermont: 60,
  Region.victoria: 61,
  Region.virginia: 62,
  Region.washington: 63,
  Region.westernAustralia: 64,
  Region.westVirginia: 65,
  Region.wisconsin: 66,
  Region.wyoming: 67,
  Region.yukon: 68,
  Region.ciudadDeMexico: 69,
  Region.jalisco: 70,
  Region.newfoundlandAndLabrador: 71,
  Region.nuevoLeon: 72,
  Region.bajaCalifornia: 73,
  Region.chihuahua: 74,
  Region.guanajuato: 75,
  Region.guerrero: 76,
  Region.mexico: 77,
  Region.michoacan: 78,
  Region.newYorkCity: 79,
  Region.tamaulipas: 80,
  Region.veracruz: 81,
  Region.chiapas: 82,
  Region.coahuila: 83,
  Region.durango: 84,
  Region.guerreroCocula: 85,
  Region.guerreroJuchitan: 86,
  Region.guerreroTepecoacuilco: 87,
  Region.guerreroTlacoapa: 88,
  Region.gujarat: 89,
  Region.hidalgo: 90,
  Region.karnataka: 91,
  Region.kerala: 92,
  Region.khyberPakhtunkhwa: 93,
  Region.madhyaPradesh: 94,
  Region.maharashtra: 95,
  Region.morelos: 96,
  Region.nayarit: 97,
  Region.oaxaca: 98,
  Region.puebla: 99,
  Region.punjab: 100,
  Region.queretaro: 101,
  Region.sanLuisPotosi: 102,
  Region.sinaloa: 103,
  Region.sonora: 104,
  Region.tabasco: 105,
  Region.tamilNadu: 106,
  Region.yucatan: 107,
  Region.zacatecas: 108,
  Region.aguascalientes: 109,
  Region.bajaCaliforniaSur: 110,
  Region.campeche: 111,
  Region.colima: 112,
  Region.quintanaRooBenitoJuarez: 113,
  Region.quintanaRoo: 114,
  Region.quintanaRooSolidaridad: 115,
  Region.tlaxcala: 116,
  Region.quintanaRooCozumel: 117,
  Region.saoPaolo: 118,
  Region.rioDeJaneiro: 119,
  Region.rioGrandeDoSul: 120,
  Region.northWestTerritories: 121,
  Region.nunavut: 122,
  Region.princeEdwardIsland: 123,
  Region.distritoFederal: 124,
  Region.maranhao: 125,
  Region.matoGrosso: 126,
  Region.minasGerais: 127,
  Region.para: 128,
  Region.parana: 129,
  Region.pernambuco: 130,
  Region.santaCatarina: 131,
  Region.andhraPradesh: 132,
  Region.ceara: 133,
  Region.goias: 134,
  Region.guerreroAcapulcoDeJuarez: 135,
  Region.haryana: 136,
  Region.sergipe: 137,
  Region.alagos: 138,
  Region.bangsamoro: 139,
};

const _$DocumentTypeEnumMap = {
  DocumentType.none: 0,
  DocumentType.consularId: 1,
  DocumentType.dl: 2,
  DocumentType.dlPublicServicesCard: 3,
  DocumentType.employmentPass: 4,
  DocumentType.finCard: 5,
  DocumentType.id: 6,
  DocumentType.multipurposeId: 7,
  DocumentType.myKad: 8,
  DocumentType.myKid: 9,
  DocumentType.myPR: 10,
  DocumentType.myTentera: 11,
  DocumentType.panCard: 12,
  DocumentType.professionalId: 13,
  DocumentType.publicServicesCard: 14,
  DocumentType.residencePermit: 15,
  DocumentType.residentId: 16,
  DocumentType.temporaryResidencePermit: 17,
  DocumentType.voterId: 18,
  DocumentType.workPermit: 19,
  DocumentType.iKad: 20,
  DocumentType.militaryId: 21,
  DocumentType.myKas: 22,
  DocumentType.docialSecurityCard: 23,
  DocumentType.healthInsuranceCard: 24,
  DocumentType.passport: 25,
  DocumentType.sPass: 26,
  DocumentType.addressCard: 27,
  DocumentType.alienId: 28,
  DocumentType.alienPassport: 29,
  DocumentType.greenCard: 30,
  DocumentType.minorsId: 31,
  DocumentType.postalId: 32,
  DocumentType.professionalDl: 33,
  DocumentType.taxId: 34,
  DocumentType.weaponPermit: 35,
  DocumentType.visa: 36,
  DocumentType.borderCrossingCard: 37,
  DocumentType.driverCard: 38,
  DocumentType.globalEntryCard: 39,
  DocumentType.mypolis: 40,
  DocumentType.nexusCard: 41,
  DocumentType.passportCard: 42,
  DocumentType.proofOfAgeCard: 43,
  DocumentType.refugeeId: 44,
  DocumentType.tribalId: 45,
  DocumentType.veteranId: 46,
  DocumentType.citizenshipCertificate: 47,
  DocumentType.myNumberCard: 48,
  DocumentType.consularPassport: 49,
  DocumentType.minorsPassport: 50,
  DocumentType.minorsPublicServicesCard: 51,
  DocumentType.drivingPriviligeCard: 52,
  DocumentType.asylumRequest: 53,
  DocumentType.driverQualificationCard: 54,
  DocumentType.provisionalDl: 55,
  DocumentType.refugeePassport: 56,
  DocumentType.specialId: 57,
  DocumentType.uniformedServicesId: 58,
  DocumentType.immigrantVisa: 59,
  DocumentType.consularVoterId: 60,
  DocumentType.twicCard: 61,
  DocumentType.exitEntryPermit: 62,
  DocumentType.mainlandTravelPermitTaiwan: 63,
  DocumentType.nbiClearance: 64,
  DocumentType.proofOfRegistration: 65,
  DocumentType.temporaryProtectionPermit: 66,
  DocumentType.afghanCitizenCard: 67,
  DocumentType.eId: 68,
  DocumentType.pass: 69,
  DocumentType.sisId: 70,
  DocumentType.asicCard: 71,
  DocumentType.bidoonCard: 72,
  DocumentType.interimHealthInsuranceCard: 73,
  DocumentType.nonVoterId: 74,
  DocumentType.reciprocalHealthInsuranceCard: 75,
  DocumentType.vehicleRegistration: 76,
  DocumentType.esaadCard: 77,
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

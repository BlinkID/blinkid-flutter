// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecognitionModeFilter _$RecognitionModeFilterFromJson(
        Map<String, dynamic> json) =>
    RecognitionModeFilter()
      ..enableMrzId = json['enableMrzId'] as bool
      ..enableMrzVisa = json['enableMrzVisa'] as bool
      ..enableMrzPassport = json['enableMrzPassport'] as bool
      ..enablePhotoId = json['enablePhotoId'] as bool
      ..enableBarcodeId = json['enableBarcodeId'] as bool
      ..enableFullDocumentRecognition =
          json['enableFullDocumentRecognition'] as bool;

Map<String, dynamic> _$RecognitionModeFilterToJson(
        RecognitionModeFilter instance) =>
    <String, dynamic>{
      'enableMrzId': instance.enableMrzId,
      'enableMrzVisa': instance.enableMrzVisa,
      'enableMrzPassport': instance.enableMrzPassport,
      'enablePhotoId': instance.enablePhotoId,
      'enableBarcodeId': instance.enableBarcodeId,
      'enableFullDocumentRecognition': instance.enableFullDocumentRecognition,
    };

ClassAnonymizationSettings _$ClassAnonymizationSettingsFromJson(
        Map<String, dynamic> json) =>
    ClassAnonymizationSettings()
      ..country = $enumDecodeNullable(_$CountryEnumMap, json['country'])
      ..region = $enumDecodeNullable(_$RegionEnumMap, json['region'])
      ..type = $enumDecodeNullable(_$TypeEnumMap, json['type'])
      ..fields = (json['fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldTypeEnumMap, e))
          .toList()
      ..documentNumberAnonymizationSettings =
          json['documentNumberAnonymizationSettings'] == null
              ? null
              : DocumentNumberAnonymizationSettings.fromJson(
                  json['documentNumberAnonymizationSettings']
                      as Map<String, dynamic>);

Map<String, dynamic> _$ClassAnonymizationSettingsToJson(
        ClassAnonymizationSettings instance) =>
    <String, dynamic>{
      'country': _$CountryEnumMap[instance.country],
      'region': _$RegionEnumMap[instance.region],
      'type': _$TypeEnumMap[instance.type],
      'fields': instance.fields.map((e) => _$FieldTypeEnumMap[e]!).toList(),
      'documentNumberAnonymizationSettings':
          instance.documentNumberAnonymizationSettings?.toJson(),
    };

const _$CountryEnumMap = {
  Country.None: 0,
  Country.Albania: 1,
  Country.Algeria: 2,
  Country.Argentina: 3,
  Country.Australia: 4,
  Country.Austria: 5,
  Country.Azerbaijan: 6,
  Country.Bahrain: 7,
  Country.Bangladesh: 8,
  Country.Belgium: 9,
  Country.BosniaAndHerzegovina: 10,
  Country.Brunei: 11,
  Country.Bulgaria: 12,
  Country.Cambodia: 13,
  Country.Canada: 14,
  Country.Chile: 15,
  Country.Colombia: 16,
  Country.CostaRica: 17,
  Country.Croatia: 18,
  Country.Cyprus: 19,
  Country.Czechia: 20,
  Country.Denmark: 21,
  Country.DominicanRepublic: 22,
  Country.Egypt: 23,
  Country.Estonia: 24,
  Country.Finland: 25,
  Country.France: 26,
  Country.Georgia: 27,
  Country.Germany: 28,
  Country.Ghana: 29,
  Country.Greece: 30,
  Country.Guatemala: 31,
  Country.HongKong: 32,
  Country.Hungary: 33,
  Country.India: 34,
  Country.Indonesia: 35,
  Country.Ireland: 36,
  Country.Israel: 37,
  Country.Italy: 38,
  Country.Jordan: 39,
  Country.Kazakhstan: 40,
  Country.Kenya: 41,
  Country.Kosovo: 42,
  Country.Kuwait: 43,
  Country.Latvia: 44,
  Country.Lithuania: 45,
  Country.Malaysia: 46,
  Country.Maldives: 47,
  Country.Malta: 48,
  Country.Mauritius: 49,
  Country.Mexico: 50,
  Country.Morocco: 51,
  Country.Netherlands: 52,
  Country.NewZealand: 53,
  Country.Nigeria: 54,
  Country.Pakistan: 55,
  Country.Panama: 56,
  Country.Paraguay: 57,
  Country.Philippines: 58,
  Country.Poland: 59,
  Country.Portugal: 60,
  Country.PuertoRico: 61,
  Country.Qatar: 62,
  Country.Romania: 63,
  Country.Russia: 64,
  Country.SaudiArabia: 65,
  Country.Serbia: 66,
  Country.Singapore: 67,
  Country.Slovakia: 68,
  Country.Slovenia: 69,
  Country.SouthAfrica: 70,
  Country.Spain: 71,
  Country.Sweden: 72,
  Country.Switzerland: 73,
  Country.Taiwan: 74,
  Country.Thailand: 75,
  Country.Tunisia: 76,
  Country.Turkey: 77,
  Country.UAE: 78,
  Country.Uganda: 79,
  Country.UK: 80,
  Country.Ukraine: 81,
  Country.Usa: 82,
  Country.Vietnam: 83,
  Country.Brazil: 84,
  Country.Norway: 85,
  Country.Oman: 86,
  Country.Ecuador: 87,
  Country.ElSalvador: 88,
  Country.SriLanka: 89,
  Country.Peru: 90,
  Country.Uruguay: 91,
  Country.Bahamas: 92,
  Country.Bermuda: 93,
  Country.Bolivia: 94,
  Country.China: 95,
  Country.EuropeanUnion: 96,
  Country.Haiti: 97,
  Country.Honduras: 98,
  Country.Iceland: 99,
  Country.Japan: 100,
  Country.Luxembourg: 101,
  Country.Montenegro: 102,
  Country.Nicaragua: 103,
  Country.SouthKorea: 104,
  Country.Venezuela: 105,
  Country.Afghanistan: 106,
  Country.AlandIslands: 107,
  Country.AmericanSamoa: 108,
  Country.Andorra: 109,
  Country.Angola: 110,
  Country.Anguilla: 111,
  Country.Antarctica: 112,
  Country.AntiguaAndBarbuda: 113,
  Country.Armenia: 114,
  Country.Aruba: 115,
  Country.BailiwickOfGuernsey: 116,
  Country.BailiwickOfJersey: 117,
  Country.Barbados: 118,
  Country.Belarus: 119,
  Country.Belize: 120,
  Country.Benin: 121,
  Country.Bhutan: 122,
  Country.BonaireSaintEustatiusAndSaba: 123,
  Country.Botswana: 124,
  Country.BouvetIsland: 125,
  Country.BritishIndianOceanTerritory: 126,
  Country.BurkinaFaso: 127,
  Country.Burundi: 128,
  Country.Cameroon: 129,
  Country.CapeVerde: 130,
  Country.CaribbeanNetherlands: 131,
  Country.CaymanIslands: 132,
  Country.CentralAfricanRepublic: 133,
  Country.Chad: 134,
  Country.ChristmasIsland: 135,
  Country.CocosIslands: 136,
  Country.Comoros: 137,
  Country.Congo: 138,
  Country.CookIslands: 139,
  Country.Cuba: 140,
  Country.Curacao: 141,
  Country.DemocraticRepublicOfTheCongo: 142,
  Country.Djibouti: 143,
  Country.Dominica: 144,
  Country.EastTimor: 145,
  Country.EquatorialGuinea: 146,
  Country.Eritrea: 147,
  Country.Ethiopia: 148,
  Country.FalklandIslands: 149,
  Country.FaroeIslands: 150,
  Country.FederatedStatesOfMicronesia: 151,
  Country.Fiji: 152,
  Country.FrenchGuiana: 153,
  Country.FrenchPolynesia: 154,
  Country.FrenchSouthernTerritories: 155,
  Country.Gabon: 156,
  Country.Gambia: 157,
  Country.Gibraltar: 158,
  Country.Greenland: 159,
  Country.Grenada: 160,
  Country.Guadeloupe: 161,
  Country.Guam: 162,
  Country.Guinea: 163,
  Country.GuineaBissau: 164,
  Country.Guyana: 165,
  Country.HeardIslandAndMcdonaldIslands: 166,
  Country.Iran: 167,
  Country.Iraq: 168,
  Country.IsleOfMan: 169,
  Country.IvoryCoast: 170,
  Country.Jamaica: 171,
  Country.Kiribati: 172,
  Country.Kyrgyzstan: 173,
  Country.Laos: 183,
  Country.Lebanon: 184,
  Country.Lesotho: 185,
  Country.Liberia: 186,
  Country.Libya: 187,
  Country.Liechtenstein: 188,
  Country.Macau: 189,
  Country.Madagascar: 190,
  Country.Malawi: 191,
  Country.Mali: 192,
  Country.MarshallIslands: 193,
  Country.Martinique: 194,
  Country.Mauritania: 195,
  Country.Mayotte: 196,
  Country.Moldova: 197,
  Country.Monaco: 198,
  Country.Mongolia: 199,
  Country.Montserrat: 200,
  Country.Mozambique: 201,
  Country.Myanmar: 202,
  Country.Namibia: 203,
  Country.Nauru: 204,
  Country.Nepal: 205,
  Country.NewCaledonia: 206,
  Country.Niger: 207,
  Country.Niue: 208,
  Country.NorfolkIsland: 209,
  Country.NorthernCyprus: 210,
  Country.NorthernMarianaIslands: 211,
  Country.NorthKorea: 212,
  Country.NorthMacedonia: 213,
  Country.Palau: 214,
  Country.Palestine: 215,
  Country.PapuaNewGuinea: 216,
  Country.Pitcairn: 217,
  Country.Reunion: 218,
  Country.Rwanda: 219,
  Country.SaintBarthelemy: 220,
  Country.SaintHelenaAscensionAndTristianDaCunha: 221,
  Country.SaintKittsAndNevis: 222,
  Country.SaintLucia: 223,
  Country.SaintMartin: 224,
  Country.SaintPierreAndMiquelon: 225,
  Country.SaintVincentAndTheGrenadines: 226,
  Country.Samoa: 227,
  Country.SanMarino: 228,
  Country.SaoTomeAndPrincipe: 229,
  Country.Senegal: 230,
  Country.Seychelles: 231,
  Country.SierraLeone: 232,
  Country.SintMaarten: 233,
  Country.SolomonIslands: 234,
  Country.Somalia: 235,
  Country.SouthGeorgiaAndTheSouthSandwichIslands: 236,
  Country.SouthSudan: 237,
  Country.Sudan: 238,
  Country.Suriname: 239,
  Country.SvalbardAndJanMayen: 240,
  Country.Eswatini: 241,
  Country.Syria: 242,
  Country.Tajikistan: 243,
  Country.Tanzania: 244,
  Country.Togo: 245,
  Country.Tokelau: 246,
  Country.Tonga: 247,
  Country.TrinidadAndTobago: 248,
  Country.Turkmenistan: 249,
  Country.TurksAndCaicosIslands: 250,
  Country.Tuvalu: 251,
  Country.UnitedStatesMinorOutlyingIslands: 252,
  Country.Uzbekistan: 253,
  Country.Vanuatu: 254,
  Country.VaticanCity: 255,
  Country.VirginIslandsBritish: 256,
  Country.VirginIslandsUs: 257,
  Country.WallisAndFutuna: 258,
  Country.WesternSahara: 259,
  Country.Yemen: 260,
  Country.Yugoslavia: 261,
  Country.Zambia: 262,
  Country.Zimbabwe: 263,
  Country.SchengenArea: 264,
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
};

const _$TypeEnumMap = {
  Type.None: 0,
  Type.ConsularId: 1,
  Type.Dl: 2,
  Type.DlPublicServicesCard: 3,
  Type.EmploymentPass: 4,
  Type.FinCard: 5,
  Type.Id: 6,
  Type.MultipurposeId: 7,
  Type.MyKad: 8,
  Type.MyKid: 9,
  Type.MyPR: 10,
  Type.MyTentera: 11,
  Type.PanCard: 12,
  Type.ProfessionalId: 13,
  Type.PublicServicesCard: 14,
  Type.ResidencePermit: 15,
  Type.ResidentId: 16,
  Type.TemporaryResidencePermit: 17,
  Type.VoterId: 18,
  Type.WorkPermit: 19,
  Type.iKad: 20,
  Type.MilitaryId: 21,
  Type.MyKas: 22,
  Type.SocialSecurityCard: 23,
  Type.HealthInsuranceCard: 24,
  Type.Passport: 25,
  Type.SPass: 26,
  Type.AddressCard: 27,
  Type.AlienId: 28,
  Type.AlienPassport: 29,
  Type.GreenCard: 30,
  Type.MinorsId: 31,
  Type.PostalId: 32,
  Type.ProfessionalDl: 33,
  Type.TaxId: 34,
  Type.WeaponPermit: 35,
  Type.Visa: 36,
  Type.BorderCrossingCard: 37,
  Type.DriverCard: 38,
  Type.GlobalEntryCard: 39,
  Type.Mypolis: 40,
  Type.NexusCard: 41,
  Type.PassportCard: 42,
  Type.ProofOfAgeCard: 43,
  Type.RefugeeId: 44,
  Type.TribalId: 45,
  Type.VeteranId: 46,
  Type.CitizenshipCertificate: 47,
  Type.MyNumberCard: 48,
  Type.ConsularPassport: 49,
  Type.MinorsPassport: 50,
  Type.MinorsPublicServicesCard: 51,
  Type.DrivingPriviligeCard: 52,
  Type.AsylumRequest: 53,
  Type.DriverQualificationCard: 54,
  Type.ProvisionalDl: 55,
  Type.RefugeePassport: 56,
  Type.SpecialId: 57,
  Type.UniformedServicesId: 58,
  Type.ImmigrantVisa: 59,
  Type.ConsularVoterId: 60,
  Type.TwicCard: 61,
  Type.ExitEntryPermit: 62,
  Type.MainlandTravelPermitTaiwan: 63,
  Type.NbiClearance: 64,
  Type.ProofOfRegistration: 65,
  Type.TemporaryProtectionPermit: 66,
  Type.AfghanCitizenCard: 67,
  Type.EId: 68,
  Type.Pass: 69,
  Type.SisId: 70,
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
};

DocumentNumberAnonymizationSettings
    _$DocumentNumberAnonymizationSettingsFromJson(Map<String, dynamic> json) =>
        DocumentNumberAnonymizationSettings()
          ..prefixDigitsVisible = (json['prefixDigitsVisible'] as num?)?.toInt()
          ..suffixDigitsVisible =
              (json['suffixDigitsVisible'] as num?)?.toInt();

Map<String, dynamic> _$DocumentNumberAnonymizationSettingsToJson(
        DocumentNumberAnonymizationSettings instance) =>
    <String, dynamic>{
      'prefixDigitsVisible': instance.prefixDigitsVisible,
      'suffixDigitsVisible': instance.suffixDigitsVisible,
    };

CustomClassRules _$CustomClassRulesFromJson(Map<String, dynamic> json) =>
    CustomClassRules()
      ..country = $enumDecodeNullable(_$CountryEnumMap, json['country'])
      ..region = $enumDecodeNullable(_$RegionEnumMap, json['region'])
      ..type = $enumDecodeNullable(_$TypeEnumMap, json['type'])
      ..detailedFieldTypes = (json['detailedFieldTypes'] as List<dynamic>)
          .map((e) => DetailedFieldType.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CustomClassRulesToJson(CustomClassRules instance) =>
    <String, dynamic>{
      'country': _$CountryEnumMap[instance.country],
      'region': _$RegionEnumMap[instance.region],
      'type': _$TypeEnumMap[instance.type],
      'detailedFieldTypes':
          instance.detailedFieldTypes.map((e) => e.toJson()).toList(),
    };

DetailedFieldType _$DetailedFieldTypeFromJson(Map<String, dynamic> json) =>
    DetailedFieldType()
      ..fieldType = $enumDecodeNullable(_$FieldTypeEnumMap, json['fieldType'])
      ..alphabetType =
          $enumDecodeNullable(_$AlphabetTypeEnumMap, json['alphabetType']);

Map<String, dynamic> _$DetailedFieldTypeToJson(DetailedFieldType instance) =>
    <String, dynamic>{
      'fieldType': _$FieldTypeEnumMap[instance.fieldType],
      'alphabetType': _$AlphabetTypeEnumMap[instance.alphabetType],
    };

const _$AlphabetTypeEnumMap = {
  AlphabetType.Latin: 0,
  AlphabetType.Arabic: 1,
  AlphabetType.Cyrillic: 2,
};

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
        Map<String, dynamic> json) =>
    ImageExtensionFactors()
      ..upFactor = (json['upFactor'] as num?)?.toDouble()
      ..rightFactor = (json['rightFactor'] as num?)?.toDouble()
      ..downFactor = (json['downFactor'] as num?)?.toDouble()
      ..leftFactor = (json['leftFactor'] as num?)?.toDouble();

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };

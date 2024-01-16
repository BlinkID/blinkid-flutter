import 'package:blinkid_flutter/recognizers/blink_id_multi_side_recognizer.dart';

/// The reason this is made as an extension is for easier future migrations.
extension NationalityAlphaCodeExtension on BlinkIdMultiSideRecognizerResult {
  /// ISO 3166 Alpha-2 country code that corresponds to the
  /// [nationality], i.e. a 2-letter country code (e.g. 'CZ').
  ///
  /// This is not an official solution. [BlinkIdMultiSideRecognizerResult] as
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
  String? get nationalityIsoAlpha2 {
    final sanitisedNationality = nationality?.latin?.trim();
    final alpha2Code = _nationalityToCountryMap[sanitisedNationality];
    if (alpha2Code == null) {
      // At this stage nationality is either unknown, or contains some
      // random value from OCR (e.g. a country name).
      // Best we can do is to check MRZ result.
      final mrzNationality = mrzResult?.nationality;
      if (mrzNationality == null) {
        return null;
      } else if (mrzNationality.length == 3) {
        return _3to2[mrzNationality.toUpperCase()];
      } else if (mrzNationality.length == 2) {
        return mrzNationality.toUpperCase();
      }
    }

    return alpha2Code;
  }
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

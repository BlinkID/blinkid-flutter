//
//  BlinkIdDeserializationUtils.swift
//  blinkid_flutter
//
//  Created by Milan Parađina on 08.04.2025..
//

import Foundation
import BlinkID
import UIKit

struct BlinkIdDeserializationUtils {
    static func deserializeBlinkIdSdkSettings(_ sdkSettingsDict: Dictionary<String, Any>?) -> BlinkIDSdkSettings? {
        var blinkidSdkSettings: BlinkIDSdkSettings?
        
        if let licenseKey = sdkSettingsDict?["licenseKey"] as? String {
            blinkidSdkSettings = BlinkIDSdkSettings(licenseKey: licenseKey)
        }
        if let licensee = sdkSettingsDict?["licensee"] as? String {
            blinkidSdkSettings?.licensee = licensee
        }
        if let helloLogEnabled = sdkSettingsDict?["helloLogEnabled"] as? Bool {
            blinkidSdkSettings?.helloLogEnabled = helloLogEnabled
        }
        if let downloadResources = sdkSettingsDict?["downloadResources"] as? Bool {
            blinkidSdkSettings?.downloadResources = downloadResources
        }
        if let resourceDownloadUrl = sdkSettingsDict?["resourceDownloadUrl"] as? String {
            blinkidSdkSettings?.resourceDownloadUrl = resourceDownloadUrl
        }
        if let resourceLocalFolder = sdkSettingsDict?["resourceLocalFolder"] as? String {
            blinkidSdkSettings?.resourceLocalFolder = resourceLocalFolder
        }
        if let bundleURL = sdkSettingsDict?["bundleURL"] as? String,
           let url = URL(string: bundleURL) {
            blinkidSdkSettings?.bundleURL = url
        }
        if let resourceRequestTimeout = sdkSettingsDict?["resourceRequestTimeout"] as? Int {
            blinkidSdkSettings?.resourceRequestTimeout = BlinkID.RequestTimeout.default
        }
        return blinkidSdkSettings
    }
    
    static func deserializeBlinkIdSessionSettings(_ sessionSettingsDict: Dictionary<String, Any>?) -> BlinkIDSessionSettings {
        var blinkidSessionSettings = BlinkIDSessionSettings()
        
        if let scanningSettings = sessionSettingsDict?["scanningSettings"] as? Dictionary<String, Any> {
            blinkidSessionSettings.scanningSettings = deserializeBlinkIdScanningSettings(scanningSettings)
        }
        
        if let scanningMode = sessionSettingsDict?["scanningMode"] as? Int {
            blinkidSessionSettings.scanningMode = deseralizeScanningMode(scanningMode)
        }
        if let stepTimeoutDuration = sessionSettingsDict?["stepTimeoutDuration"] as? Int {
            blinkidSessionSettings.stepTimeoutDuration = Double(stepTimeoutDuration) / 1000.0
        }
        
        return blinkidSessionSettings
    }
    
    static func deserializeBlinkIdScanningSettings(_ scanningSettingsDict: Dictionary<String, Any>?) -> ScanningSettings {
        var scanningSettings = ScanningSettings()
        
        if let blurDetectionLevel = scanningSettingsDict?["blurDetectionLevel"] as? Int {
            scanningSettings.blurDetectionLevel = deseralizeDetectionLevel(blurDetectionLevel)
        }
        if let skipImagesWithBlur = scanningSettingsDict?["skipImagesWithBlur"] as? Bool {
            scanningSettings.skipImagesWithBlur = skipImagesWithBlur
        }
        if let glareDetectionLevel = scanningSettingsDict?["glareDetectionLevel"] as? Int {
            scanningSettings.glareDetectionLevel = deseralizeDetectionLevel(glareDetectionLevel)
        }
        if let skipImagesWithGlare = scanningSettingsDict?["skipImagesWithGlare"] as? Bool {
            scanningSettings.skipImagesWithGlare = skipImagesWithGlare
        }
        if let tiltDetectionLevel = scanningSettingsDict?["tiltDetectionLevel"] as? Int {
            scanningSettings.tiltDetectionLevel = deseralizeDetectionLevel(tiltDetectionLevel)
        }
        if let skipImagesWithInadequateLightingConditions = scanningSettingsDict?["skipImagesWithInadequateLightingConditions"] as? Bool {
            scanningSettings.skipImagesWithInadequateLightingConditions = skipImagesWithInadequateLightingConditions
        }
        if let skipImagesOccludedByHand = scanningSettingsDict?["skipImagesOccludedByHand"] as? Bool {
            scanningSettings.skipImagesOccludedByHand = skipImagesOccludedByHand
        }
        if let combineResultsFromMultipleInputImages = scanningSettingsDict?["combineResultsFromMultipleInputImages"] as? Bool {
            scanningSettings.combineResultsFromMultipleInputImages = combineResultsFromMultipleInputImages
        }
        if let enableBarcodeScanOnly = scanningSettingsDict?["enableBarcodeScanOnly"] as? Bool {
            scanningSettings.enableBarcodeScanOnly = enableBarcodeScanOnly
        }
        
        if let customDocumentRules = scanningSettingsDict?["customDocumentRules"] as? Array<Dictionary<String, Any>> {
            scanningSettings.customDocumentRules = deserializeCustomDocumentRules(customDocumentRules)
        }
        
        if let anonymizationMode = scanningSettingsDict?["anonymizationMode"] as? Int {
            scanningSettings.anonymizationMode = deseralizeAnonymizationMode(anonymizationMode)
        }
        if let customDocumentAnonymizationSettings = scanningSettingsDict?["customDocumentAnonymizationSettings"] as? Array<Dictionary<String, Any>> {
            scanningSettings.customDocumentAnonymizationSettings = deserializeCustomDocumentAnonymizationSettings(customDocumentAnonymizationSettings)
        }
        if let returnInputImages = scanningSettingsDict?["returnInputImages"] as? Bool {
            scanningSettings.returnInputImages = returnInputImages
        }
        if let scanCroppedDocumentImage = scanningSettingsDict?["scanCroppedDocumentImage"] as? Bool {
            scanningSettings.scanCroppedDocumentImage = scanCroppedDocumentImage
        }
        if let recognitionModeFilter = scanningSettingsDict?["recognitionModeFilter"] as? Dictionary<String, Any> {
            scanningSettings.recognitionModeFilter = deserializeRecognitionModeFilter(recognitionModeFilter)
        }
        if let inputImageMargin = scanningSettingsDict?["inputImageMargin"] as? Double {
            scanningSettings.inputImageMargin = Float(inputImageMargin)
        }
        if let scanUnsupportedBack = scanningSettingsDict?["scanUnsupportedBack"] as? Bool {
            scanningSettings.scanUnsupportedBack = scanUnsupportedBack
        }
        if let allowUncertainFrontSideScan = scanningSettingsDict?["allowUncertainFrontSideScan"] as? Bool {
            scanningSettings.allowUncertainFrontSideScan = allowUncertainFrontSideScan
        }
        if let maxAllowedMismatchesPerField = scanningSettingsDict?["maxAllowedMismatchesPerField"] as? Int {
            scanningSettings.maxAllowedMismatchesPerField = maxAllowedMismatchesPerField
        }
        if let scanPassportDataPageOnly = scanningSettingsDict?["scanPassportDataPageOnly"] as? Bool {
            scanningSettings.scanPassportDataPageOnly = scanPassportDataPageOnly
        }
        if let croppedImageSettings = scanningSettingsDict?["croppedImageSettings"] as? Dictionary<String, Any> {
            scanningSettings.croppedImageSettings = deserializeBlinkIdCroppedImageSettings(croppedImageSettings)
        }
        
        return scanningSettings
    }
    
    static func deserializeBlinkIdCroppedImageSettings(_ croppedImageSettingsDict: Dictionary<String, Any>) -> CroppedImageSettings {
        var croppedImageSettings = CroppedImageSettings()
        
        if let dotsPerInch = croppedImageSettingsDict["dotsPerInch"] as? Int {
            croppedImageSettings.dotsPerInch = dotsPerInch
        }
        if let extensionFactor = croppedImageSettingsDict["extensionFactor"] as? Double {
            croppedImageSettings.extensionFactor = Float(extensionFactor)
        }
        if let returnDocumentImage = croppedImageSettingsDict["returnDocumentImage"] as? Bool {
            croppedImageSettings.returnDocumentImage = returnDocumentImage
        }
        if let returnFaceImage = croppedImageSettingsDict["returnFaceImage"] as? Bool {
            croppedImageSettings.returnFaceImage = returnFaceImage
        }
        if let returnSignatureImage = croppedImageSettingsDict["returnSignatureImage"] as? Bool {
            croppedImageSettings.returnSignatureImage = returnSignatureImage
        }
        
        return croppedImageSettings
    }
    
    
    static func deseralizeDetectionLevel(_ value: Int) -> DetectionLevel {
        switch value {
        case 0:
            return DetectionLevel.off
        case 1:
            return DetectionLevel.low
        case 2:
            return DetectionLevel.mid
        case 3:
            return DetectionLevel.high
        default:
            return DetectionLevel.mid
        }
    }
    
    static func deseralizeAnonymizationMode(_ value: Int) -> AnonymizationMode {
        switch value {
        case 0:
            return AnonymizationMode.none
        case 1:
            return AnonymizationMode.imageOnly
        case 2:
            return AnonymizationMode.resultFieldsOnly
        case 3:
            return AnonymizationMode.fullResult
        default:
            return AnonymizationMode.fullResult
        }
    }
    
    static func deseralizeScanningMode(_ value: Int) -> ScanningMode {
        switch value {
        case 0:
            return ScanningMode.single
        case 1:
            return ScanningMode.automatic
        default:
            return ScanningMode.automatic
        }
    }
    
    static func deserializeRecognitionModeFilter(_ recognitionModeFilterDict: Dictionary<String, Any>) -> RecognitionModeFilter {
        var recognitionModeFilter = RecognitionModeFilter()
        
        if let enableMrzId = recognitionModeFilterDict["enableMrzId"] as? Bool {
            recognitionModeFilter.enableMrzId = enableMrzId
        }
        if let enableMrzVisa = recognitionModeFilterDict["enableMrzVisa"] as? Bool {
            recognitionModeFilter.enableMrzVisa = enableMrzVisa
        }
        if let enableMrzPassport = recognitionModeFilterDict["enableMrzPassport"] as? Bool {
            recognitionModeFilter.enableMrzPassport = enableMrzPassport
        }
        if let enablePhotoId = recognitionModeFilterDict["enablePhotoId"] as? Bool {
            recognitionModeFilter.enablePhotoId = enablePhotoId
        }
        if let enableBarcodeId = recognitionModeFilterDict["enableBarcodeId"] as? Bool {
            recognitionModeFilter.enableBarcodeId = enableBarcodeId
        }
        if let enableFullDocumentRecognition = recognitionModeFilterDict["enableFullDocumentRecognition"] as? Bool {
            recognitionModeFilter.enableFullDocumentRecognition = enableFullDocumentRecognition
        }
        return recognitionModeFilter
    }
    
    static func deserializeCustomDocumentRules(_ customDocumentRulesArray: [[String: Any]]) -> [DocumentRules] {
        var documentRulesArr = Array<DocumentRules>()
        
        for customRuleDict in customDocumentRulesArray {
            guard let fields = customRuleDict["detailedFieldTypes"] as? Array<Dictionary<String, Any>> else { continue }
            
            let deserializedFields = fields.compactMap { deserializeDetailedFieldType($0) }
            var documentRule = DocumentRules(fields: deserializedFields)
            
            if let documentFilter = customRuleDict["documentFilter"] as? [String: Any] {
                documentRule.documentFilter = deserializeDocumentFilter(documentFilter)
            }
            
            documentRulesArr.append(documentRule)
        }
        
        return documentRulesArr
    }
    
    static func deserializeDocumentFilter(_ documentFilterDict: Dictionary<String, Any>) -> DocumentFilter {
        var documentFilter = DocumentFilter()
        
        if let country = documentFilterDict["country"] as? String {
            documentFilter.country = Country.init(rawValue: country)
        }
        
        if let region = documentFilterDict["region"] as? String {
            documentFilter.region = Region.init(rawValue: region)
        }
        
        if let documentType = documentFilterDict["documentType"] as? String {
            documentFilter.documentType = DocumentType.init(rawValue: documentType)
        }
        return documentFilter
    }
    
    static func deserializeDetailedFieldType(_ detailedFieldTypeDict: Dictionary<String, Any>?) -> DetailedFieldType? {
        if let fieldType = detailedFieldTypeDict?["fieldType"] as? String,
           let alphabetType = detailedFieldTypeDict?["alphabetType"] as? String,
           let fieldTypeValue = FieldType.init(rawValue: fieldType),
           let alphabetTypeValue = AlphabetType(rawValue: alphabetType) {
            return DetailedFieldType(
                fieldType: fieldTypeValue,
                alphabetType: alphabetTypeValue)
        }
        return nil
    }
    
    static func deserializeCustomDocumentAnonymizationSettings(_ customAnonymizationArray: Array<Dictionary<String, Any>>) -> [DocumentAnonymizationSettings] {
        var documentAnonymizationSettingsArray = Array<DocumentAnonymizationSettings>()
        
        for customAnonymizationDict in customAnonymizationArray {
            guard let fields = customAnonymizationDict["fields"] as? Array<String> else { continue }
            var documentAnonymizationSettings = DocumentAnonymizationSettings(fields: deserializeFieldType(fields))
            
            if let documentFilter = customAnonymizationDict["documentFilter"] as? Dictionary<String, Any> {
                documentAnonymizationSettings.documentFilter = deserializeDocumentFilter(documentFilter)
            }
            
            if let documentNumberAnonymizationSettings = customAnonymizationDict["documentNumberAnonymizationSettings"] as? Dictionary<String, Any> {
                documentAnonymizationSettings.documentNumberAnonymizationSettings = deserializeDocumentNumberAnonymizationSettings(documentNumberAnonymizationSettings)
            }
            
            documentAnonymizationSettingsArray.append(documentAnonymizationSettings)
        }
        
        return documentAnonymizationSettingsArray
    }
    
    static func deserializeDocumentNumberAnonymizationSettings(_ documentNumberAnonymizationSettingsDict: Dictionary<String, Any>) -> DocumentNumberAnonymizationSettings {
        var documentNumberAnonymizationSettings = DocumentNumberAnonymizationSettings()
        
        if let prefixDigitsVisible = documentNumberAnonymizationSettingsDict["prefixDigitsVisible"] as? Int {
            documentNumberAnonymizationSettings.prefixDigitsVisible = prefixDigitsVisible
        }
        if let suffixDigitsVisible = documentNumberAnonymizationSettingsDict["suffixDigitsVisible"] as? Int {
            documentNumberAnonymizationSettings.suffixDigitsVisible = suffixDigitsVisible
        }
        return documentNumberAnonymizationSettings
    }
    
    static func deserializeFieldType(_ fieldType: Array<String>) -> [FieldType] {
        return fieldType.compactMap { FieldType.init(rawValue: $0) }
    }
    
    static func deserializeClassFilter(_ classFilterDictArr: Dictionary<String, Any>?, _ classInfo: BlinkID.BlinkIDSDK.DocumentClassInfo) -> Bool {
        guard let sanitizedDict = sanitizeDictionary(classFilterDictArr) else { return true}
        var includeClass = false
        var excludeClass = true
        
        if let includedClasses = sanitizedDict["includeDocuments"] as? Array<Dictionary<String, Any>> {
            for includedClass in includedClasses {
                includeClass = includeClass || matchClassFilter(includedClass, classInfo: classInfo)
            }
        } else {
            includeClass = true
        }
        
        if let excludedClasses = sanitizedDict["excludeDocuments"] as? Array<Dictionary<String, Any>> {
            for excludedClass in excludedClasses {
                excludeClass = excludeClass && !matchClassFilter(excludedClass, classInfo: classInfo)
            }
        }
        
        return includeClass && excludeClass
    }
    
    static func matchClassFilter(_ filteredClass: Dictionary<String, Any>, classInfo: BlinkID.BlinkIDSDK.DocumentClassInfo) -> Bool {
        let country = filteredClass["country"] as? String
        let type = filteredClass["documentType"] as? String
        let region = filteredClass["region"] as? String
        
        return (country == nil || classInfo.country == Country.init(rawValue: country!)) &&
        (type == nil || classInfo.documentType == DocumentType.init(rawValue: type!) &&
         (region == nil || classInfo.region == Region.init(rawValue: region!)))
    }
    
    static func sanitizeDictionary(_ dictionary: Dictionary<String, Any>?) -> Dictionary<String, Any>? {
        if let dictionary = dictionary {
            var sanitized = dictionary
            for (key, value) in dictionary {
                if value is NSNull {
                    sanitized[key] = nil
                }
            }
            return sanitized
        }
        return nil
    }
    
    static func deserializeBase64Image(_ base64Image: String?) -> UIImage? {
        if let base64Image = base64Image,
        let data = Data(base64Encoded: base64Image, options: .ignoreUnknownCharacters) {
            return UIImage(data: data)
        }
        return nil
    }
}

extension DocumentType {
    static let allCases: [DocumentType] = [
        .none,
        .consularId,
        .dl,
        .dlPublicServicesCard,
        .employmentPass,
        .finCard,
        .id,
        .multipurposeId,
        .myKad,
        .myKid,
        .myPR,
        .myTentera,
        .panCard,
        .professionalId,
        .publicServicesCard,
        .residencePermit,
        .residentId,
        .temporaryResidencePermit,
        .voterId,
        .workPermit,
        .iKad,
        .militaryId,
        .myKas,
        .socialSecurityCard,
        .healthInsuranceCard,
        .passport,
        .sPass,
        .addressCard,
        .alienId,
        .alienPassport,
        .greenCard,
        .minorsId,
        .postalId,
        .professionalDl,
        .taxId,
        .weaponPermit,
        .visa,
        .borderCrossingCard,
        .driverCard,
        .globalEntryCard,
        .mypolis,
        .nexusCard,
        .passportCard,
        .proofOfAgeCard,
        .refugeeId,
        .tribalId,
        .veteranId,
        .citizenshipCertificate,
        .myNumberCard,
        .consularPassport,
        .minorsPassport,
        .minorsPublicServicesCard,
        .drivingPrivilegeCard,
        .asylumRequest,
        .driverQualificationCard,
        .provisionalDl,
        .refugeePassport,
        .specialId,
        .uniformedServicesId,
        .immigrantVisa,
        .consularVoterId,
        .twicCard,
        .exitEntryPermit,
        .mainlandTravelPermitTaiwan,
        .nbiClearance,
        .proofOfRegistration,
        .temporaryProtectionPermit,
        .afghanCitizenCard,
        .eid,
        .pass,
        .sisId,
        .asicCard,
        .bidoonCard,
        .interimHealthInsuranceCard,
        .nonVoterId,
        .reciprocalHealthInsuranceCard,
        .vehicleRegistration,
        .esaadCard,
        .registrationCertificate,
        .medicalMarijuanaId
    ]
}

extension Country {
    static let allCases: [Country] = [
        .none,
        .albania,
        .algeria,
        .argentina,
        .australia,
        .austria,
        .azerbaijan,
        .bahrain,
        .bangladesh,
        .belgium,
        .bosniaAndHerzegovina,
        .brunei,
        .bulgaria,
        .cambodia,
        .canada,
        .chile,
        .colombia,
        .costaRica,
        .croatia,
        .cyprus,
        .czechia,
        .denmark,
        .dominicanRepublic,
        .egypt,
        .estonia,
        .finland,
        .france,
        .georgia,
        .germany,
        .ghana,
        .greece,
        .guatemala,
        .hongKong,
        .hungary,
        .india,
        .indonesia,
        .ireland,
        .israel,
        .italy,
        .jordan,
        .kazakhstan,
        .kenya,
        .kosovo,
        .kuwait,
        .latvia,
        .lithuania,
        .malaysia,
        .maldives,
        .malta,
        .mauritius,
        .mexico,
        .morocco,
        .netherlands,
        .newZealand,
        .nigeria,
        .pakistan,
        .panama,
        .paraguay,
        .philippines,
        .poland,
        .portugal,
        .puertoRico,
        .qatar,
        .romania,
        .russia,
        .saudiArabia,
        .serbia,
        .singapore,
        .slovakia,
        .slovenia,
        .southAfrica,
        .spain,
        .sweden,
        .switzerland,
        .taiwan,
        .thailand,
        .tunisia,
        .turkey,
        .uae,
        .uganda,
        .uk,
        .ukraine,
        .usa,
        .vietnam,
        .brazil,
        .norway,
        .oman,
        .ecuador,
        .elSalvador,
        .sriLanka,
        .peru,
        .uruguay,
        .bahamas,
        .bermuda,
        .bolivia,
        .china,
        .europeanUnion,
        .haiti,
        .honduras,
        .iceland,
        .japan,
        .luxembourg,
        .montenegro,
        .nicaragua,
        .southKorea,
        .venezuela,
        .afghanistan,
        .alandIslands,
        .americanSamoa,
        .andorra,
        .angola,
        .anguilla,
        .antarctica,
        .antiguaAndBarbuda,
        .armenia,
        .aruba,
        .bailiwickOfGuernsey,
        .bailiwickOfJersey,
        .barbados,
        .belarus,
        .belize,
        .benin,
        .bhutan,
        .bonaireSaintEustatiusAndSaba,
        .botswana,
        .bouvetIsland,
        .britishIndianOceanTerritory,
        .burkinaFaso,
        .burundi,
        .cameroon,
        .capeVerde,
        .caribbeanNetherlands,
        .caymanIslands,
        .centralAfricanRepublic,
        .chad,
        .christmasIsland,
        .cocosIslands,
        .comoros,
        .congo,
        .cookIslands,
        .cuba,
        .curacao,
        .democraticRepublicOfTheCongo,
        .djibouti,
        .dominica,
        .eastTimor,
        .equatorialGuinea,
        .eritrea,
        .ethiopia,
        .falklandIslands,
        .faroeIslands,
        .federatedStatesOfMicronesia,
        .fiji,
        .frenchGuiana,
        .frenchPolynesia,
        .frenchSouthernTerritories,
        .gabon,
        .gambia,
        .gibraltar,
        .greenland,
        .grenada,
        .guadeloupe,
        .guam,
        .guinea,
        .guineaBissau,
        .guyana,
        .heardIslandAndMcdonaldIslands,
        .iran,
        .iraq,
        .isleOfMan,
        .ivoryCoast,
        .jamaica,
        .kiribati,
        .kyrgyzstan,
        .laos,
        .lebanon,
        .lesotho,
        .liberia,
        .libya,
        .liechtenstein,
        .macau,
        .madagascar,
        .malawi,
        .mali,
        .marshallIslands,
        .martinique,
        .mauritania,
        .mayotte,
        .moldova,
        .monaco,
        .mongolia,
        .montserrat,
        .mozambique,
        .myanmar,
        .namibia,
        .nauru,
        .nepal,
        .newCaledonia,
        .niger,
        .niue,
        .norfolkIsland,
        .northernCyprus,
        .northernMarianaIslands,
        .northKorea,
        .northMacedonia,
        .palau,
        .palestine,
        .papuaNewGuinea,
        .pitcairn,
        .reunion,
        .rwanda,
        .saintBarthelemy,
        .saintHelenaAscensionAndTristianDaCunha,
        .saintKittsAndNevis,
        .saintLucia,
        .saintMartin,
        .saintPierreAndMiquelon,
        .saintVincentAndTheGrenadines,
        .samoa,
        .sanMarino,
        .saoTomeAndPrincipe,
        .senegal,
        .seychelles,
        .sierraLeone,
        .sintMaarten,
        .solomonIslands,
        .somalia,
        .southGeorgiaAndTheSouthSandwichIslands,
        .southSudan,
        .sudan,
        .suriname,
        .svalbardAndJanMayen,
        .eswatini,
        .syria,
        .tajikistan,
        .tanzania,
        .togo,
        .tokelau,
        .tonga,
        .trinidadAndTobago,
        .turkmenistan,
        .turksAndCaicosIslands,
        .tuvalu,
        .unitedStatesMinorOutlyingIslands,
        .uzbekistan,
        .vanuatu,
        .vaticanCity,
        .virginIslandsBritish,
        .virginIslandsUs,
        .wallisAndFutuna,
        .westernSahara,
        .yemen,
        .yugoslavia,
        .zambia,
        .zimbabwe,
        .schengen_area,
    ]
}

extension Region {
    static let allCases: [Region] = [
        .none,
        .alabama,
        .alaska,
        .alberta,
        .arizona,
        .arkansas,
        .australianCapitalTerritory,
        .britishColumbia,
        .california,
        .colorado,
        .connecticut,
        .delaware,
        .districtOfColumbia,
        .florida,
        .georgia,
        .hawaii,
        .idaho,
        .illinois,
        .indiana,
        .iowa,
        .kansas,
        .kentucky,
        .louisiana,
        .maine,
        .manitoba,
        .maryland,
        .massachusetts,
        .michigan,
        .minnesota,
        .mississippi,
        .missouri,
        .montana,
        .nebraska,
        .nevada,
        .newBrunswick,
        .newHampshire,
        .newJersey,
        .newMexico,
        .newSouthWales,
        .newYork,
        .northernTerritory,
        .northCarolina,
        .northDakota,
        .novaScotia,
        .ohio,
        .oklahoma,
        .ontario,
        .oregon,
        .pennsylvania,
        .quebec,
        .queensland,
        .rhodeIsland,
        .saskatchewan,
        .southAustralia,
        .southCarolina,
        .southDakota,
        .tasmania,
        .tennessee,
        .texas,
        .utah,
        .vermont,
        .victoria,
        .virginia,
        .washington,
        .westernAustralia,
        .westVirginia,
        .wisconsin,
        .wyoming,
        .yukon,
        .ciudadDeMexico,
        .jalisco,
        .newfoundlandAndLabrador,
        .nuevoLeon,
        .bajaCalifornia,
        .chihuahua,
        .guanajuato,
        .guerrero,
        .mexico,
        .michoacan,
        .newYorkCity,
        .tamaulipas,
        .veracruz,
        .chiapas,
        .coahuila,
        .durango,
        .guerreroCocula,
        .guerreroJuchitan,
        .guerreroTepecoacuilco,
        .guerreroTlacoapa,
        .gujarat,
        .hidalgo,
        .karnataka,
        .kerala,
        .khyberPakhtunkhwa,
        .madhyaPradesh,
        .maharashtra,
        .morelos,
        .nayarit,
        .oaxaca,
        .puebla,
        .punjab,
        .queretaro,
        .sanLuisPotosi,
        .sinaloa,
        .sonora,
        .tabasco,
        .tamilNadu,
        .yucatan,
        .zacatecas,
        .aguascalientes,
        .bajaCaliforniaSur,
        .campeche,
        .colima,
        .quintanaRooBenitoJuarez,
        .quintanaRoo,
        .quintanaRooSolidaridad,
        .tlaxcala,
        .quintanaRooCozumel,
        .saoPaolo,
        .rioDeJaneiro,
        .rioGrandeDoSul,
        .northwestTerritories,
        .nunavut,
        .princeEdwardIsland,
        .distritoFederal,
        .maranhao,
        .matoGrosso,
        .minasGerais,
        .para,
        .parana,
        .pernambuco,
        .santaCatarina,
        .andhraPradesh,
        .ceara,
        .goias,
        .guerreroAcapulcoDeJuarez,
        .haryana,
        .sergipe,
        .alagoas,
        .bangsamoro,
    ]
}

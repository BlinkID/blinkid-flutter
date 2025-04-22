package com.microblink.blinkid.flutter

import android.graphics.BitmapFactory
import android.os.Parcelable
import com.microblink.blinkid.core.BlinkIdSdkSettings
import com.microblink.blinkid.core.result.AlphabetType
import com.microblink.blinkid.core.result.FieldType
import com.microblink.blinkid.core.result.classinfo.Country
import com.microblink.blinkid.core.result.classinfo.DocumentClassInfo
import com.microblink.blinkid.core.result.classinfo.Region
import com.microblink.blinkid.core.result.classinfo.Type
import com.microblink.blinkid.core.session.BlinkIdSessionSettings
import com.microblink.blinkid.core.session.ScanningMode
import com.microblink.blinkid.core.settings.AnonymizationMode
import com.microblink.blinkid.core.settings.CroppedImageSettings
import com.microblink.blinkid.core.settings.DetailedFieldType
import com.microblink.blinkid.core.settings.DetectionLevel
import com.microblink.blinkid.core.settings.DocumentFilter
import com.microblink.blinkid.core.settings.DocumentRules
import com.microblink.blinkid.core.settings.RecognitionModeFilter
import com.microblink.blinkid.core.settings.ScanningSettings
import com.microblink.blinkid.ux.settings.BlinkIdUxSettings
import com.microblink.blinkid.core.settings.DocumentAnonymizationSettings
import com.microblink.blinkid.ux.settings.ClassFilter
import com.microblink.core.utils.defaultResourceDownloadUrl
import com.microblink.core.utils.defaultResourcesLocalFolder
import kotlin.time.Duration.Companion.milliseconds
import kotlinx.parcelize.Parcelize
import kotlinx.parcelize.RawValue
import android.graphics.Bitmap
import android.util.Base64
import com.microblink.blinkid.core.session.InputImageSource

object BlinkidDeserializationUtils {

    fun deserializeBlinkidSdkSettings(blinkidSdkSettingsMap: Map<String, Any>?): BlinkIdSdkSettings? {
        val licenseKey = blinkidSdkSettingsMap?.get("licenseKey") as? String ?: return null

        return BlinkIdSdkSettings(
            licenseKey = licenseKey,
            licensee = blinkidSdkSettingsMap["licensee"] as? String,
            downloadResources = blinkidSdkSettingsMap["downloadResources"] as? Boolean ?: true,
            resourceDownloadUrl = blinkidSdkSettingsMap["resourceDownloadUrl"] as? String
                ?: defaultResourceDownloadUrl,
            resourceLocalFolder = blinkidSdkSettingsMap["resourceLocalFolder"] as? String
                ?: defaultResourcesLocalFolder,
        )
    }

    fun deserializeBlinkidSessionSettings(
        blinkidSdkSessionSettingsMap: Map<String, Any>?,
        isDirectApi: Boolean
    ): BlinkIdSessionSettings {
        if (blinkidSdkSessionSettingsMap == null) return BlinkIdSessionSettings()

        return BlinkIdSessionSettings(
            inputImageSource = if (isDirectApi) InputImageSource.Photo else InputImageSource.Video,
            scanningMode = ScanningMode.entries[blinkidSdkSessionSettingsMap["scanningMode"] as? Int
                ?: ScanningMode.Automatic.ordinal],
            scanningSettings = deserializeScanningSettings(blinkidSdkSessionSettingsMap["scanningSettings"] as? Map<String, Any>),
        )
    }

    private fun deserializeScanningSettings(scanningSettingsMap: Map<String, Any>?): ScanningSettings {
        if (scanningSettingsMap == null) return ScanningSettings()
        return ScanningSettings(
            blurDetectionLevel = DetectionLevel.entries[scanningSettingsMap["blurDetectionLevel"] as? Int
                ?: DetectionLevel.Mid.ordinal],
            skipImagesWithBlur = scanningSettingsMap["skipImagesWithBlur"] as? Boolean ?: true,
            glareDetectionLevel = DetectionLevel.entries[scanningSettingsMap["glareDetectionLevel"] as? Int
                ?: DetectionLevel.Mid.ordinal],
            skipImagesWithGlare = scanningSettingsMap["skipImagesWithGlare"] as? Boolean ?: true,
            tiltDetectionLevel = DetectionLevel.entries[scanningSettingsMap["tiltDetectionLevel"] as? Int
                ?: DetectionLevel.Off.ordinal],
            skipImagesWithInadequateLightingConditions = scanningSettingsMap["skipImagesWithInadequateLightingConditions"] as? Boolean
                ?: false,
            skipImagesOccludedByHand = scanningSettingsMap["skipImagesOccludedByHand"] as? Boolean
                ?: false,
            combineResultsFromMultipleInputImages = scanningSettingsMap["combineResultsFromMultipleInputImages"] as? Boolean
                ?: true,
            enableBarcodeScanOnly = scanningSettingsMap["enableBarcodeScanOnly"] as? Boolean
                ?: false,
            customDocumentRules = deserializeDocumentRules(scanningSettingsMap["customDocumentRules"] as? List<Map<String, Any>>),
            anonymizationMode = AnonymizationMode.entries[scanningSettingsMap["anonymizationMode"] as? Int
                ?: AnonymizationMode.FullResult.ordinal],
            customDocumentAnonymizationSettings = deserializeCustomAnonymizationSetings(
                scanningSettingsMap["customDocumentAnonymizationSettings"] as? List<Map<String, Any>>
            ),
            returnInputImages = scanningSettingsMap["returnInputImages"] as? Boolean ?: false,
            scanCroppedDocumentImage = scanningSettingsMap["scanCroppedDocumentImage"] as? Boolean
                ?: false,
            recognitionModeFilter = deserializeRecognitionModeFilter(scanningSettingsMap["recognitionModeFilter"] as? Map<String, Any>),
            enableCharacterValidation = scanningSettingsMap["enableCharacterValidation"] as? Boolean
                ?: true,
            inputImageMargin = (scanningSettingsMap["inputImageMargin"] as? Number)?.toFloat()
                ?: 0.02f,
            scanUnsupportedBack = scanningSettingsMap["scanUnsupportedBack"] as? Boolean ?: false,
            allowUncertainFrontSideScan = scanningSettingsMap["allowUncertainFrontSideScan"] as? Boolean
                ?: false,
            maxAllowedMismatchesPerField = (scanningSettingsMap["maxAllowedMismatchesPerField"] as? Int)?.toUInt()
                ?: 0u,
            scanPassportDataPageOnly = scanningSettingsMap["scanPassportDataPageOnly"] as? Boolean
                ?: true,
            croppedImageSettings = deserializeCroppedImageSettings(scanningSettingsMap["croppedImageSettings"] as? Map<String, Any>),
        )
    }

    private fun deserializeCroppedImageSettings(croppedImageSettingsMap: Map<String, Any>?): CroppedImageSettings {
        if (croppedImageSettingsMap == null) return CroppedImageSettings()
        return CroppedImageSettings(
            dotsPerInch = (croppedImageSettingsMap["dotsPerInch"] as? Int)?.toUShort() ?: 0u,
            extensionFactor = croppedImageSettingsMap["extensionFactor"] as? Float ?: 0.0f,
            returnDocumentImage = croppedImageSettingsMap["returnDocumentImage"] as? Boolean
                ?: false,
            returnFaceImage = croppedImageSettingsMap["returnFaceImage"] as? Boolean ?: false,
            returnSignatureImage = croppedImageSettingsMap["returnSignatureImage"] as? Boolean
                ?: false,
        )
    }

    fun deserializeDocumentRules(documentRulesMapArray: List<Map<String, Any>>?): List<DocumentRules> {
        if (documentRulesMapArray == null) return emptyList()
        val documentRulesList = mutableListOf<DocumentRules>()

        for (documentRulesMap in documentRulesMapArray) {
            (documentRulesMap["fields"] as? List<Map<String, Any>>)?.let { fields ->
                val deserializedFields = fields.mapNotNull { deserializeDetailedFieldType(it) }
                documentRulesList.add(
                    DocumentRules(
                        deserializeDocumentFilter(documentRulesMap["documentFilter"] as? Map<String, Any>),
                        deserializedFields
                    )
                )
            } ?: continue
        }
        return documentRulesList
    }

    private fun deserializeDetailedFieldType(detailedFieldTypeMap: Map<String, Any>?): DetailedFieldType? {
        val fieldTypeIndex = detailedFieldTypeMap?.get("fieldType") as? Int
        val alphabetTypeIndex = detailedFieldTypeMap?.get("alphabetType") as? Int

        return if (fieldTypeIndex != null && alphabetTypeIndex != null) {
            DetailedFieldType(
                FieldType.entries[fieldTypeIndex],
                AlphabetType.entries[alphabetTypeIndex]
            )
        } else {
            null
        }
    }

    private fun deserializeDocumentFilter(documentFilterMap: Map<String, Any>?): DocumentFilter {
        return if (documentFilterMap != null) {
            val filter = DocumentFilter()

            (documentFilterMap["country"] as? Int)?.let {
                filter.country = Country.entries[it]
            }
            (documentFilterMap["region"] as? Int)?.let {
                filter.region = Region.entries[it]
            }
            (documentFilterMap["documentType"] as? Int)?.let {
                filter.type = Type.entries[it]
            }
            filter
        } else {
            DocumentFilter()
        }
    }

    fun deserializeCustomAnonymizationSetings(customAnonymizationSettingsMapArray: List<Map<String, Any>>?): List<DocumentAnonymizationSettings> {
        if (customAnonymizationSettingsMapArray == null) return emptyList()

        val customAnonymizationList = mutableListOf<DocumentAnonymizationSettings>()
        for (customAnonymizationSettingsMap in customAnonymizationSettingsMapArray) {
            (customAnonymizationSettingsMap["fields"] as? List<Int>)?.let { fields ->
                val deserializedFields = fields.map { FieldType.entries[it] }
                customAnonymizationList.add(
                    DocumentAnonymizationSettings(
                        deserializeDocumentFilter(customAnonymizationSettingsMap["documentFilter"] as? Map<String, Any>),
                        deserializedFields
                    )
                )
            } ?: continue
        }
        return customAnonymizationList
    }


    fun deserializeRecognitionModeFilter(recognitionModeFilterMap: Map<String, Any>?): RecognitionModeFilter {
        if (recognitionModeFilterMap == null) return RecognitionModeFilter()
        val filter = RecognitionModeFilter()
        filter.enableMrzId = recognitionModeFilterMap["enableMrzId"] as? Boolean ?: true
        filter.enableMrzVisa = recognitionModeFilterMap["enableMrzVisa"] as? Boolean ?: true
        filter.enablePhotoId = recognitionModeFilterMap["enablePhotoId"] as? Boolean ?: true
        filter.enableBarcodeId = recognitionModeFilterMap["enableBarcodeId"] as? Boolean ?: true
        filter.enableMrzPassport = recognitionModeFilterMap["enableMrzPassport"] as? Boolean ?: true
        filter.enableFullDocumentRecognition =
            recognitionModeFilterMap["enableFullDocumentRecognition"] as? Boolean ?: true
        return filter
    }


    fun deserializeBlinkidUxSettings(
        blinkidUxSettingsMap: Map<String, Any>?,
        classFilterMap: Map<String, Any>?
    ): BlinkIdUxSettings {
        if (blinkidUxSettingsMap == null) return BlinkIdUxSettings()
        return BlinkIdUxSettings(
            stepTimeoutDuration = (blinkidUxSettingsMap["stepTimeoutDuration"] as? Int
                ?: 15000).milliseconds,
            classFilter = CustomClassFilter(classFilterMap)
        )
    }

    fun deserializeClassFilter(
        classFilterMap: Map<String, Any>?,
        classInfo: DocumentClassInfo
    ): Boolean {
        if (classFilterMap == null) return true

        var includeClass = false
        var excludeClass = true

        val includedClasses = classFilterMap["includeDocuments"] as? List<Map<String, Any>>
        if (includedClasses != null) {
            for (includedClass in includedClasses) {
                includeClass = includeClass || matchClassFilter(includedClass, classInfo)
            }
        } else {
            includeClass = true
        }

        val excludedClasses = classFilterMap["excludeDocuments"] as? List<Map<String, Any>>
        if (excludedClasses != null) {
            for (excludedClass in excludedClasses) {
                excludeClass = excludeClass && !matchClassFilter(excludedClass, classInfo)
            }
        }

        return includeClass && excludeClass
    }

    private fun matchClassFilter(
        filteredClass: Map<String, Any>,
        classInfo: DocumentClassInfo
    ): Boolean {
        val country = filteredClass["country"] as? Int
        val region = filteredClass["region"] as? Int
        val documentType = filteredClass["documentType"] as? Int

        return (country == null || country == classInfo.country?.ordinal) &&
                (region == null || region == classInfo.region?.ordinal) &&
                (documentType == null || documentType == classInfo.type?.ordinal)
    }

    fun base64ToBitmap(base64Str: String?): Bitmap? {
        return try {
            val decodedBytes = Base64.decode(base64Str, Base64.DEFAULT)
            BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.size)
        } catch (e: IllegalArgumentException) {
            null
        }
    }
}

@Parcelize
private class CustomClassFilter(
    private val classFilterMap: @RawValue Map<String, Any>?
) : ClassFilter, Parcelable {

    override fun classAllowed(documentClass: DocumentClassInfo): Boolean {
        return BlinkidDeserializationUtils.deserializeClassFilter(classFilterMap, documentClass)
    }
}

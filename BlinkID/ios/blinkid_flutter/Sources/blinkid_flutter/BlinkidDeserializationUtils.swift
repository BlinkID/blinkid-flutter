//
//  BlinkidDeserializationUtils.swift
//  blinkid_flutter
//
//  Created by Milan Parađina on 08.04.2025..
//

import Foundation
import BlinkID

struct BlinkidDeserializationUtils {
    static func deserializeBlinkIdSdkSettings(_ sdkSettingsDict: Dictionary<String, Any>?) -> BlinkIDSdkSettings? {
        var blinkidSettings: BlinkIDSdkSettings?
        
        if let licenseKey = sdkSettingsDict?["licenseKey"] as? String {
            blinkidSettings = BlinkIDSdkSettings(licenseKey: licenseKey)
        }
        if let licensee = sdkSettingsDict?["licensee"] as? String {
            blinkidSettings?.licensee = licensee
        }
        if let helloLogEnabled = sdkSettingsDict?["helloLogEnabled"] as? Bool {
            blinkidSettings?.helloLogEnabled = helloLogEnabled
        }
        if let downloadResources = sdkSettingsDict?["downloadResources"] as? Bool {
            blinkidSettings?.downloadResources = downloadResources
        }
        if let resourceDownloadUrl = sdkSettingsDict?["resourceDownloadUrl"] as? String {
            blinkidSettings?.resourceDownloadUrl = resourceDownloadUrl
        }
        if let resourceLocalFolder = sdkSettingsDict?["resourceLocalFolder"] as? String {
            blinkidSettings?.resourceLocalFolder = resourceLocalFolder
        }
        if let bundleURL = sdkSettingsDict?["bundleURL"] as? String,
            let url = URL(string: bundleURL) {
            blinkidSettings?.bundleURL = url
        }
        if let resourceRequestTimeout = sdkSettingsDict?["resourceRequestTimeout"] as? Int {
            blinkidSettings?.resourceRequestTimeout = BlinkID.RequestTimeout.default
        }
        return blinkidSettings
    }
}

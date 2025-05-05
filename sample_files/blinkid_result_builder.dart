import 'package:blinkid_flutter/blinkid_result.dart';

class BlinkIdResultBuilder {
  static String getIdResultString(BlinkIdScanningResult? result) {
    if (result != null) {
      return "Recognition mode: ${result.recognitionMode?.name}\n" +
          buildResult(result.firstName, "First name") +
          buildResult(result.lastName, "Last name") +
          buildResult(result.fullName, "Full name") +
          buildResult(result.localizedName, "Localized name") +
          buildResult(
            result.additionalNameInformation,
            "Additional name info",
          ) +
          buildResult(result.address, "Address") +
          buildResult(
            result.additionalAddressInformation,
            "Additional address info",
          ) +
          buildResult(result.documentNumber, "Document number") +
          buildResult(
            result.documentAdditionalNumber,
            "Additional document number",
          ) +
          buildResult(result.sex, "Sex") +
          buildResult(result.issuingAuthority, "Issuing authority") +
          buildResult(result.nationality, "Nationality") +
          buildDateResult(result.dateOfBirth, "Date of birth") +
          buildDateResult(result.dateOfIssue, "Date of issue") +
          buildDateResult(result.dateOfExpiry, "Date of expiry") +
          buildResult(result.maritalStatus, "Martial status") +
          buildResult(result.personalIdNumber, "Personal Id Number") +
          buildResult(result.profession, "Profession") +
          buildResult(result.race, "Race") +
          buildResult(result.religion, "Religion") +
          buildResult(result.residentialStatus, "Residential Status") +
          buildDriverLicenceResult(result.driverLicenseDetailedInfo) +
          buildDataMatchResult(result.dataMatchResult) +
          buildDocumentClassInfoResult(result.documentClassInfo) +
          buildSubresults(result.subResults);
    }
    return "";
  }

  static String buildSubresults(List<SingleSideScanningResult>? subResults) {
    String subResultsString = "";
    if (subResults != null) {
      for (var singleSideResult in subResults.asMap().entries) {
        final index = singleSideResult.key;
        final result = singleSideResult.value;

        subResultsString += "\nDocument side ${index + 1} information:\n";
        subResultsString += buildVizResult(result.viz);
        subResultsString += buildMrzResult(result.mrz);
        subResultsString += buildBarcodeResult(result.barcode);
      }
    }
    return subResultsString;
  }

  static String buildMrzResult(MrzResult? result) {
    if (result == null) {
      return "";
    }

    return "\nMRZ result:\n" +
        buildStringResult(result.documentCode, "Document code") +
        buildStringResult(result.documentNumber, "Document number") +
        buildStringResult(result.gender, "Gender") +
        buildStringResult(result.issuer, "Issuer") +
        buildStringResult(result.issuerName, "Issuer name") +
        buildStringResult(result.nationality, "Nationality") +
        buildStringResult(result.nationalityName, "Nationality name") +
        buildStringResult(result.opt1, "Opt1") +
        buildStringResult(result.opt2, "Opt2") +
        buildStringResult(result.primaryID, "Primary ID") +
        buildStringResult(result.secondaryID, "Secondary ID") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry");
  }

  static String buildBarcodeResult(BarcodeResult? result) {
    if (result == null) {
      return "";
    }
    return "\nBarcode result:\n" +
        buildStringResult(
          result.additionalNameInformation,
          "Additional name information",
        ) +
        buildStringResult(result.address, "Address") +
        buildStringResult(
          result.documentAdditionalNumber,
          "Document additional number",
        ) +
        buildStringResult(result.documentNumber, "Document number") +
        buildStringResult(result.employer, "Employer") +
        buildStringResult(result.firstName, "First name") +
        buildStringResult(result.lastName, "Last name") +
        buildStringResult(result.fullName, "Full name") +
        buildStringResult(result.issuingAuthority, "Issuing authority") +
        buildStringResult(result.maritalStatus, "Marital status") +
        buildStringResult(result.nationality, "Nationality") +
        buildStringResult(result.personalIdNumber, "Personal ID number") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry") +
        buildDateResult(result.dateOfIssue, "Date of issue");
  }

  static String buildVizResult(VizResult? result) {
    if (result == null) {
      return "";
    }
    return "\nVIZ result:\n" +
        buildResult(
          result.additionalAddressInformation,
          "Additional address information",
        ) +
        buildResult(
          result.additionalNameInformation,
          "Additional name information",
        ) +
        buildResult(result.address, "Address") +
        buildResult(result.bloodType, "Blood type") +
        buildResult(result.documentNumber, "Document number") +
        buildResult(result.documentSubtype, "Document subtype") +
        buildResult(result.employer, "Employer") +
        buildResult(result.firstName, "First name") +
        buildResult(result.lastName, "Last name") +
        buildResult(result.fullName, "Full name") +
        buildResult(result.issuingAuthority, "Issuing authority") +
        buildResult(result.maritalStatus, "Marital status") +
        buildResult(result.nationality, "Nationality") +
        buildResult(result.placeOfBirth, "Place of birth") +
        buildDateResult(result.dateOfBirth, "Date of birth") +
        buildDateResult(result.dateOfExpiry, "Date of expiry") +
        buildDateResult(result.dateOfIssue, "Nationality");
  }

  static String buildResult(StringResult? result, String propertyName) {
    if (result == null || result.value == null || result!.value!.isEmpty) {
      return "";
    }

    return "$propertyName: ${result.value!}\n";
  }

  static String buildDocumentClassInfoResult(DocumentClassInfo? result) {
    if (result == null) {
      return "";
    }

    return "\nDocument class information:\nCountry: ${result.country?.name}\nRegion:${result.region?.name}\nDocument type: ${result.documentType?.name}\n";
  }

  static String buildDateResult(DateResult? result, String propertyName) {
    if (result == null || result!.date == null || result.date!.year == 0) {
      return "";
    }
    if (result.originalString is StringResult) {
      return buildResult(result.originalString, propertyName);
    } else {
      return buildStringResult(result.originalString, propertyName);
    }
  }

  static String buildStringResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return "$propertyName: $result\n";
  }

  static String buildIntResult(int? result, String propertyName) {
    if (result == null || result < 0) {
      return "";
    }

    return "$propertyName: $result\n";
  }

  static String buildDriverLicenceResult(DriverLicenseDetailedInfo? result) {
    if (result == null) {
      return "";
    }

    return buildResult(result.restrictions, "Restrictions") +
        buildResult(result.endorsements, "Endorsements") +
        buildResult(result.vehicleClass, "Vehicle class") +
        buildResult(result.conditions, "Conditions");
  }

  static String buildDataMatchResult(DataMatchResult? dataMatchresult) {
    if (dataMatchresult == null) {
      return "";
    }

    String dataMatchResultString =
        "\nData match information:\nState for whole document: ${dataMatchresult.overallState?.name}\n";

    for (DataMatchResultField field in dataMatchresult!.states!) {
      dataMatchResultString += "${field.field?.name}: ${field.state?.name}\n";
    }
    return dataMatchResultString;
  }
}

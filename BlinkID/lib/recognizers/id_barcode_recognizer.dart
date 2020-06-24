import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'id_barcode_recognizer.g.dart';

/// Result object for IdBarcodeRecognizer.
class IdBarcodeRecognizerResult extends RecognizerResult {
    
    ///THe additional address information of the document owner. 
    String additionalAddressInformation;
    
    ///The additional name information of the document owner. 
    String additionalNameInformation;
    
    ///The address of the document owner. 
    String address;
    
    ///The current age of the document owner in years. It is calculated difference 
    int age;
    
    ///The format of the scanned barcode. 
    BarcodeType barcodeType;
    
    ///The date of birth of the document owner. 
    Date dateOfBirth;
    
    ///The date of expiry of the document. 
    Date dateOfExpiry;
    
    ///The date of issue of the document. 
    Date dateOfIssue;
    
    ///The additional number of the document. 
    String documentAdditionalNumber;
    
    ///The document number. 
    String documentNumber;
    
    ///The document type deduced from the recognized barcode 
    IdBarcodeDocumentType documentType;
    
    ///The employer of the document owner. 
    String employer;
    
    ///The additional privileges granted to the driver license owner. 
    String endorsements;
    
    ///The first name of the document owner. 
    String firstName;
    
    ///The full name of the document owner. 
    String fullName;
    
    ///The issuing authority of the document. 
    String issuingAuthority;
    
    ///The last name of the document owner. 
    String lastName;
    
    ///The marital status of the document owner. 
    String maritalStatus;
    
    ///The nationality of the documet owner. 
    String nationality;
    
    ///The personal identification number. 
    String personalIdNumber;
    
    ///The place of birth of the document owner. 
    String placeOfBirth;
    
    ///The profession of the document owner. 
    String profession;
    
    ///The race of the document owner. 
    String race;
    
    ///The raw bytes contained inside barcode. 
    String rawData;
    
    ///The religion of the document owner. 
    String religion;
    
    ///The residential status of the document owner. 
    String residentialStatus;
    
    ///The restrictions to driving privileges for the driver license owner. 
    String restrictions;
    
    ///The sex of the document owner. 
    String sex;
    
    ///String representation of data inside barcode. 
    String stringData;
    
    ///True if returned result is uncertain, i.e. if scanned barcode was incomplete (i.e. 
    bool uncertain;
    
    ///The type of vehicle the driver license owner has privilege to drive. 
    String vehicleClass;
    
    IdBarcodeRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"];
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"];
        
        this.address = nativeResult["address"];
        
        this.age = nativeResult["age"];
        
        this.barcodeType = BarcodeType.values[nativeResult["barcodeType"] ];
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"];
        
        this.documentNumber = nativeResult["documentNumber"];
        
        this.documentType = IdBarcodeDocumentType.values[nativeResult["documentType"]];
        
        this.employer = nativeResult["employer"];
        
        this.endorsements = nativeResult["endorsements"];
        
        this.firstName = nativeResult["firstName"];
        
        this.fullName = nativeResult["fullName"];
        
        this.issuingAuthority = nativeResult["issuingAuthority"];
        
        this.lastName = nativeResult["lastName"];
        
        this.maritalStatus = nativeResult["maritalStatus"];
        
        this.nationality = nativeResult["nationality"];
        
        this.personalIdNumber = nativeResult["personalIdNumber"];
        
        this.placeOfBirth = nativeResult["placeOfBirth"];
        
        this.profession = nativeResult["profession"];
        
        this.race = nativeResult["race"];
        
        this.rawData = nativeResult["rawData"];
        
        this.religion = nativeResult["religion"];
        
        this.residentialStatus = nativeResult["residentialStatus"];
        
        this.restrictions = nativeResult["restrictions"];
        
        this.sex = nativeResult["sex"];
        
        this.stringData = nativeResult["stringData"];
        
        this.uncertain = nativeResult["uncertain"];
        
        this.vehicleClass = nativeResult["vehicleClass"];
        
    }
}


///The ID Barcode Recognizer is used for scanning ID Barcode.
@JsonSerializable()
class IdBarcodeRecognizer extends Recognizer {
    
    IdBarcodeRecognizer(): super('IdBarcodeRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return IdBarcodeRecognizerResult(nativeResult);
    }

    factory IdBarcodeRecognizer.fromJson(Map<String, dynamic> json) => _$IdBarcodeRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$IdBarcodeRecognizerToJson(this);
}
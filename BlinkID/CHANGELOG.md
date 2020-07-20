## 5.6.0

### New features:

- We have translated complete SDK to following languages: **Croatian**, **Czech**, **English**, **French**, **German**, **Italian**, **Portuguese**, **Slovak**, and **Spanish**.

- In `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer` we added:
    - Support for US documents with **vertical** orientations:
        - Alabama DL
        - Arizona DL
        - California DL
        - Colorado DL
        - Connecticut DL
        - Georgia DL
        - Illinois DL
        - Iowa DL
        - Kansas DL
        - Kentucky DL
        - Maryland DL
        - Massachusetts DL
        - Minnesota DL
        - Missouri DL
        - New Jersey DL
        - Ohio DL
        - Pennsylvania DL
        - South Carolina DL
        - Tennessee DL
        - Texas DL
        - Utah DL
        - Washington DL
        - Wisconsin DL
    - Support for **new document types**:
        - Croatia Health Insurance Card / front side / BETA
        - Ecuador ID / front side
        - El Salvador ID / BETA
        - Sri Lanka ID / BETA
    - No longer BETA:
        - Canada Nova Scotia DL
        - Canada Yukon DL
        - Norway DL
    - Back side support:
        - Kenya ID
    - **Result anonymization** - with this option enabled, results are not returned for protected fields on certain documents. The full document image will also have this data blacked out.
    	- Protected fields are:
         - Document number on Hong Kong ID
         - MRZ on Hong Kong passports
         - Personal ID number on Netherlands DL
         - Personal ID number and MRZ on Netherlands ID
         - MRZ on Netherlands passports
         - Document number on Singapore DL, ID, Fin Card, Resident ID
         - Personal ID number on Singapore Employment Pass
         - Document number and personal ID number on Singapore Work Permit
         - MRZ on Singapore passports
   		- By using `anonymizationMode` property, you can choose the `AnonymizationMode`: `ImageOnly`, `ResultFieldsOnly`, `FullResult` or `None`.
    	- `FullResult` anonymization (both images and data) is set by default.

- We added support for new **MRZ** formats:
    - Guatemala ID
    - Kenya ID

### Improvements to existing features:

- We updated `UsdlRecognizerResult` and `IdBarcodeRecognizer.Result` with additional address fields:
    - `street`, `postalCode`, `city` and `jurisdiction` 
- We added `expired` (in Swift `isExpired`) property to `BlinkIdRecognizerResult`, `BlinkIdCombinedRecognizerResult` and `IdBarcodeRecognizerResult`.
    - It compares the current time on the device with the date of expiry and checks whether the document has expired or not. 
- We made changes to the result structure of `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer`:
    - Barcode data is now encapsulated in its own result structure: `BarcodeResult`.
    - Data from all OCR-ed fields, without MRZ data, is now encapsulated in a `VizResult` structure, representing the "Visual Inspection Zone" data. In `BlinkIdCombinedRecognizer`, front side data is available in its own structure (`frontVizResult`), back side data in its own (`backVizResult`), so you can now **access data from each side separately**.
    - The main part of the result, outside these structures, is filled according to these rules:
        - Document number is filled with data from the MRZ, if present.
        - Remaining data is then filled with barcode data.
        - Remaining data is filled from the back side's visual inspection zone (OCR data outside of MRZ).
        - Remaining data is filled from the front side's visual inspection zone.
        - Remaining data is filled with data from the MRZ.

### Minor API changes:

- We moved `BlinkIdRecognizerResult` members `colorStatus` and `moireStatus` to the result's `imageAnalysisResult` (`frontImageAnalysisResult` and `backImageAnalysisResult` in `BlinkIDCombinedRecognizerResult`).

### Bug fixes:

- We fixed US driver's license address extraction (Oregon, Mississippi, Rhode Island).
- We removed OpenGL entirely which was causing unexpected crashes.

## 5.5.0+1

Updated README for 5.5.0

## 5.5.0

### New features:

- In `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer` we added:
	- Support for obtaining full document image for IDs with barcodes. Now you can capture document image and extract barcode data with a single scan.
	- Scanning & data extraction for  travel visas and passports.
	- Field validation - we validate if the results from certain fields match predefined character sets.
			- If validation fails, the recognizer's state is `RecognizerResultStateUncertain`.
			- Use `validateResultCharacters`to enable or disable validation.
	- Field anonymization for sensitive data.
			- Enable or disable whether certain sensitive data should be anonymized in full document image result.
			- Use `anonymizeImage` to enable or disable image anonymization.
	
	- Support for new document types:
		- Australia New South Wales - ID Card / Front only / BETA
		- Brazil - Driver License / BETA
		- Brunei - Military ID / BETA
		- Brunei - Residence Permit / BETA
		- Brunei - Temporary Residence Permit / BETA
		- Ghana - Driver License / Front only
		- Latvia - ID Card
		- Norway - Driving Licence / Front only / BETA
		- Oman - ID Card
		- Saudi Arabia - ID Card / BETA
		- Sweden - Social Security Card / Front only
		- USA - Social Security Card / BETA
		- Back side supported:
			- Malaysia - MyTentera

	- No longer BETA:
		- Australia Tasmania - Driving Licence
		- Canada British Columbia - ID Card
		- Germany - Residence Permit
		- Morocco - ID Card
		- Nigeria - Voter ID
		- Singapore - Work Permit
		- USA Alaska - ID Card
		- USA District Of Columbia - Driver License
		- USA Indiana - ID Card
		- USA Kentucky - ID Card
	
	- Barcode scanning on the following documents:
		- Argentina ID
		- Colombia ID
		- Nigeria Voter ID
		- South Africa ID

### Improvements for existing features:

- Improvements in `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer`:
	- Documents discarded with the class filter are now reported as not supported
		-  `onDocumentSupportStatus` will be called if a documents is filtered out by the `classInfoFilter`.
	- For Malaysian MyKad we are now returning if a Moire pattern is present on the scanned document (detected or not detected).
		- use `documentImageMoireStatus` in `BlinkIdRecognizer`.
		- use `documentFrontImageMoireStatus` and `documentBackImageMoireStatus` in `BlinkIdCombinedRecognizer`.
- We added digital signature support to `PassportRecognizer`. 
- We updated `IdBarcodeRecognizerResult` with specific driving license info.
	- Use `restrictions`, `endorsements` and `vehicleClass`

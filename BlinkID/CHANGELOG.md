## 5.6.0

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

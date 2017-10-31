visiting-document
visitDocument: aDocument

	| propertiesSton |
	aDocument properties ifNotEmpty: [
		propertiesSton := String new: 100 streamContents: [ :internalStream |
		(STON writer on: internalStream) nextPut: aDocument properties ].
		canvas raw: propertiesSton.
		canvas newLine ].
	super visitDocument: aDocument
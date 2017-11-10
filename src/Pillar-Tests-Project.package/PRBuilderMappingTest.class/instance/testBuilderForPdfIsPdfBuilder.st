tests
testBuilderForPdfIsPdfBuilder

	self assert: (PRTarget builderClassForName: 'pdf') equals: PRPdfOutput
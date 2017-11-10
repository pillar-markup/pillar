tests
testBuilderForHtmlIsHtmlBuilder

	self assert: (PRTarget builderClassForName: 'html') equals: PRHtmlOutput.
	self assert: ((PRTarget builderForName: 'html') isKindOf: PRHtmlOutput)
tests
testUpperCaseCapitalization

	self testTemplateForCapitalizationHeader: 'upper case' text: 'i am a header' expected: 'I AM A HEADER'.
	self testTemplateForCapitalizationHeaderWithBold: 'upper case' text: 'i am a header' expected: 'I AM A HEADER'.
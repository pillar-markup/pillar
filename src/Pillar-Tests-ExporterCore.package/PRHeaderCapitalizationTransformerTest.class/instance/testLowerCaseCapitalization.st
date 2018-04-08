tests
testLowerCaseCapitalization

	self testTemplateForCapitalizationHeader: 'lower case' text: 'I AM A HEADER' expected: 'i am a header'.
	self testTemplateForCapitalizationHeaderWithBold: 'lower case' text: 'I AM A HEADER' expected: 'i am a header'.
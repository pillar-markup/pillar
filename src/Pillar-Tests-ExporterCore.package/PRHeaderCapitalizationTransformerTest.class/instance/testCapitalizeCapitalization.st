tests
testCapitalizeCapitalization

	self testTemplateForCapitalizationHeader: 'capitalize' text: 'i am a header' expected: 'I Am A Header'.
	self testTemplateForCapitalizationHeaderWithBold: 'capitalize' text: 'i am a header' expected: 'I Am A Header'.
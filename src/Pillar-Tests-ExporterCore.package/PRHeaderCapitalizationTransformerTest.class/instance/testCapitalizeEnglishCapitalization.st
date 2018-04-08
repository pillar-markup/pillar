tests
testCapitalizeEnglishCapitalization

	self testTemplateForCapitalizationHeader: 'capitalize english' text: 'i am a header' expected: 'I Am a Header'.
	self testTemplateForCapitalizationHeaderWithBold: 'capitalize english' text: 'i like to code in Pharo for a long time' expected: 'I Like to Code in Pharo for a Long Time'.
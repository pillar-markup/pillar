tests
testNotUnderstandCapitalizationType

	self testTemplateForCapitalizationHeader: 'hello' text: 'i aM A HeaDer' expected: 'i aM A HeaDer'.
	self testTemplateForCapitalizationHeaderWithBold: 'hello' text: 'i aM A HeaDer' expected: 'i aM A HeaDer'.
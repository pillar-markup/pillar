tests - Annotation
testAnnotationParameters
	| expected |
	super testAnnotationParameters.
	expected := OrderedDictionary new.
	expected at: 'foo' put: 'bar'.
	expected at: 'timo' put: 'leon'.
	self assert: result equals:  expected
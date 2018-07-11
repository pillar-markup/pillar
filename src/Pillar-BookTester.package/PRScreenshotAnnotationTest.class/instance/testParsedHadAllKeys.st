helpers
testParsedHadAllKeys

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation packageName equals: 'Pillar-BookTester'.
	self assert: annotation className equals: 'PRScreenshotAnnotationTest'.
	self assert: annotation methodName equals: 'referenceString'.
	self assert: annotation caption equals: 'The referenceString method'.
	self assert: annotation width equals: 50.
	self assert: annotation label equals: 'refStr'.
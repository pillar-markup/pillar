tests
testWriteDocOf
	| aStream |
	aStream := String new writeStream.
	PRDocGeneratorAboutScriptLanguage new writeDocOf: PRSmalltalkScriptLanguage on: aStream.
	self assert: aStream contents equals: '- PRSmalltalkScriptLanguage which tag is: smalltalk' , String lf
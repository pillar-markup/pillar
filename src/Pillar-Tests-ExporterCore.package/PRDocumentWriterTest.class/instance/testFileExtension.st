tests
testFileExtension
	| fileExtension |
	fileExtension := self instance fileExtension.
	self assert: fileExtension notNil.
	self assert: fileExtension isString
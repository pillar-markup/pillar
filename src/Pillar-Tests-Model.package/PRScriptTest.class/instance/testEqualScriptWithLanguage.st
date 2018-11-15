tests
testEqualScriptWithLanguage
	| param1 param2 |
	param1 := SmallDictionary new
		at: 'language' put: 'smalltalk';
		yourself.
	param2 := SmallDictionary new
		at: 'language' put: 'html';
		yourself.
	self
		assert: (self actualClass content: 'foo' parameters: param1) ~= (self actualClass content: 'foo' parameters: param2).
	self
		assert:
			(self actualClass content: 'foo' parameters: param1)
				equals: (self actualClass content: 'foo' parameters: param1)
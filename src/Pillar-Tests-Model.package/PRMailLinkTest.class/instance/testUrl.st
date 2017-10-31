tests-accessing
testUrl
	self instance reference: self referenceString.
	self assert: (self instance url beginsWith: 'mailto:').
	self assert: self instance url ~= ('mailto:' , self referenceString).
	self assert: self instance scrambledUrl ~= ('mailto:' , self referenceString).
	self assert: self instance unscrambledUrl = ('mailto:' , self referenceString)
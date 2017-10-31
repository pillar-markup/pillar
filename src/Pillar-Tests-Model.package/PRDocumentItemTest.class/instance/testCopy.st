tests-copying
testCopy
	self assert: self instance = self instance copy.
	self assert: self instance hash = self instance copy hash.

	self deny: self instance == self instance copy
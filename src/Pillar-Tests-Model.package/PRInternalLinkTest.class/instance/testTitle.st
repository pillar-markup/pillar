tests-accessing
testTitle
	super testTitle.
	self instance reference: 'page'.
	self assert: self instance title = 'page'
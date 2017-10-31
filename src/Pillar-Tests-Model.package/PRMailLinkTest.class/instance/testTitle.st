tests-accessing
testTitle
	super testTitle.
	self instance reference: self referenceString.
	self assert: self instance title = self referenceString
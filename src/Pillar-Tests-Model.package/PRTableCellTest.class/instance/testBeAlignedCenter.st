tests-accessing
testBeAlignedCenter
	self instance beAlignedCenter.
	self assert: self instance align = #center.
	self assert: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
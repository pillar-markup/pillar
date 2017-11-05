tests-accessing
testBeAlignedRight
	self instance beAlignedRight.
	self assert: self instance align = #right.
	self deny: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self assert: self instance isAlignedRight
tests-accessing
testBeAlignedLeft
	self instance beAlignedLeft.
	self assert: self instance align = #left.
	self deny: self instance isAlignedCenter.
	self assert: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
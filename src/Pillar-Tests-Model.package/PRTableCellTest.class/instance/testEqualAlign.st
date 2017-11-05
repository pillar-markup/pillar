tests-comparing
testEqualAlign
	self deny: self actualClass new beAlignedRight
				= self actualClass new beAlignedCenter.
	self deny: self actualClass new beAlignedCenter
				= self actualClass new beAlignedLeft
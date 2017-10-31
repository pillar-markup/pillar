tests-accessing
testHeading
	self deny: self instance heading.
	self deny: self instance isHeading.
	
	self instance heading: true.
	self assert: self instance heading.
	self assert: self instance isHeading.
	
	self instance heading: false.
	self deny: self instance heading.
	self deny: self instance isHeading
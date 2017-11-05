tests-accessing
testTitle
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title = 'http://www.lukas-renggli.ch'
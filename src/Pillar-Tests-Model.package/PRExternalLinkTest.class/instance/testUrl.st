tests-accessing
testUrl
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url = 'http://www.lukas-renggli.ch'
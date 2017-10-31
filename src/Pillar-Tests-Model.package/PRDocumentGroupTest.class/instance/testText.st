tests-accessing
testText
	self instance addAll: self foobarInstances.
	self assert: self instance text = 'foobar'
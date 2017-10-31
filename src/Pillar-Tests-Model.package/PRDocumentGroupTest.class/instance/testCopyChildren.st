tests-copying
testCopyChildren
	self instance addAll: self foobarInstances.
	self assert: self instance children = self instance copy children.
	self deny: self instance children == self instance copy children.
	self instance children
		with: self instance copy children
		do: [ :a :b | self assert: a = b. self deny: a == b ]
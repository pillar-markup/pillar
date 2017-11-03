tests
testIntrospectExistingArbitraryObjectReturnsAsString

	| object command |
	object := { 'a' . #b . 1 . 2.3 . Object new . Class }.
	command := self introspectorWithConfiguredObject: object.
	
	self assert: (command introspect: 'known') equals: object asString.
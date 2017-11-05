tests
testAsJsonWithoutProperties
	| conf expected |
	conf :=  self configurationClass  new.
	expected := '' writeStream
		<< '{';
		<< '}';
		yourself.
	self assert: conf asJson equals: expected contents
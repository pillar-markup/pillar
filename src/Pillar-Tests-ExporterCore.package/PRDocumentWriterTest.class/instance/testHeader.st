tests
testHeader
	| item |
	item := PRHeader new
		level: 1;
		add: (PRText content: 'foo');
		yourself.
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}.
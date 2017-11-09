private-parameterizable
performTest

	^ self
		perform: testSelector asSymbol
		withArguments: (testArguments collect: [ :each | self perform: each ])
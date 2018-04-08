tests
testSpecifyPackageNamesUnderTest
	self assert: self packageNamesUnderTest isCollection.
	self deny: self packageNamesUnderTest isEmpty.
	self packageNamesUnderTest
		do: [ :packageName | self deny: (RPackage organizer packageNamed: packageName) methodReferences isEmpty ]
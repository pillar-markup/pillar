utilities
assertTree: aDocument equalsText: aString
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
tests
testHeaderOne

	| aNode aContents |
	aNode := PRHeader new 
		level: 1;
		add: (PRText new text: 'Header One').

	aContents := (FileReference newTempFilePrefix: 'a' suffix: 'b')
		writeStreamDo: [ :writeStream | 
			PRHTMLWriter new write: aNode to: writeStream ];
		contents.
		
	self assert: aContents trimBoth equals: '<h1>Header One</h1>' trimBoth
*Pillar-BookTester
textForTestDefinitionParameter
	"Same as MethodDefinition?"
	"returns an Array of preformated text for TestDefinition testing
	The Array contains: 
		-Class Name
		-Method Name
		-Method Body"
	('*>>*' match: self text)
			ifTrue: [ ^ Array with: (self text splitOn: '>>') first
		 						   with: (((self text splitOn: '>>') second) splitOn: '
') first
		 							with: ('
' join: (((self text splitOn: '>>') second) splitOn: '
') allButFirst) ]
			ifFalse: [ ^ self text ]
	 
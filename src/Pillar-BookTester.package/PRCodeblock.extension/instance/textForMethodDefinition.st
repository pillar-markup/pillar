*Pillar-BookTester
textForMethodDefinition
	"returns an Array of preformated text for MethodDefinition testing
	The Array contains: 
		-Class Name
		-Method Name
		-Method Body"
	"(PRCodeblock content: 'classname >> methodName
blabla
blabla' parameters: nil) textForMethodDefinitionParameter >>>  #('classname' 'methodName' 'blabla
blabla') "
		
	('*>>*' match: self text)
			ifTrue: [ ^ Array with: ((self text splitOn: '>>') first trimBoth splitOn: ' ')
		 						   with: (((self text splitOn: '>>') second) splitOn: '
') first trimBoth
		 							with: ('
' join: (((self text splitOn: '>>') second) splitOn: '
') allButFirst) trimBoth ]
			ifFalse: [ ^ self text ]
	 
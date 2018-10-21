visiting
visitShowClassAnnotation: aPRShowClassAnnotation
	
	| classShown textOfClassDefinition|
	classShown := self class environment at: aPRShowClassAnnotation shownClassName ifAbsent: [ nil ].
	textOfClassDefinition := classShown isNil 
										ifTrue: [ 'The system was looking for ', aPRShowClassAnnotation shownClassName, ' but did not find it' ]
										ifFalse: [ classShown definition ].
	self replace: {	
							(PRCodeblock 
								content: textOfClassDefinition 
								parameters: (OrderedDictionary new 
															add: 'classDefinition' -> true;
															yourself))}
"
I am a transformer for the showClass annotation.

I know how to  visit a showClass annotation and the way to transform it.

I create a PRCodeblock with the class definition within it.
"
Class {
	#name : #PRShowClassTransformer,
	#superclass : #PRNodeTransformer,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #visiting }
PRShowClassTransformer >> visitShowClassAnnotation: aPRShowClassAnnotation [
	
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
]

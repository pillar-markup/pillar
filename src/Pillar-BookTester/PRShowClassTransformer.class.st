"
I am a transformer for the showClass annotation.

I know how to  visit a showClass annotation and the way to transform it.

I create a PRCodeblock with the class definition within it.
"
Class {
	#name : #PRShowClassTransformer,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-BookTester-Annotations'
}

{ #category : #visiting }
PRShowClassTransformer >> visitShowClassAnnotation: aPRShowClassAnnotation [

	| textOfClassDefinition |
	textOfClassDefinition := self class environment
		                         at: aPRShowClassAnnotation shownClassName
		                         ifPresent: [ :classShown | 
		                         classShown definitionString ]
		                         ifAbsent: [ 
			                         'The system was looking for '
			                         , aPRShowClassAnnotation shownClassName
			                         , ' but did not find it' ].
	self replace: { (PRCodeblock
			 content: textOfClassDefinition
			 parameters: (OrderedDictionary new
					  add: 'classDefinition' -> true;
					  yourself)) }
]

"
I am a transformer for the showMethod annotation.

I know how to  visit a showMethod annotation and the way to transform it.

I create a PRCodeblock with the method definition within it.
"
Class {
	#name : #PRShowMethodTransformer,
	#superclass : #PRNodeTransformer,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #visiting }
PRShowMethodTransformer >> visitShowMethodAnnotation: aPRShowMethodAnnotation [
	
	| shownClass methodName methodDefinition |
	shownClass := self class environment at: aPRShowMethodAnnotation shownClassName ifAbsent: [nil].
	methodName := aPRShowMethodAnnotation shownMethodName.

	shownClass isNil
		ifTrue: [ methodDefinition := 'The system was looking for ', aPRShowMethodAnnotation shownClassName, ' but did not find it' ]
		ifFalse: [
	methodDefinition := (shownClass canUnderstand: methodName)
		ifFalse: [ 'The system was looking for ', aPRShowMethodAnnotation shownClassName, ' but did not find the method ', methodName ]
		ifTrue: [ (shownClass asString, ' >> ', (shownClass compiledMethodAt: methodName) sourceCode) ]].
	
	self replace: {(PRCodeblock 
								content: methodDefinition 
					  			parameters: (OrderedDictionary new add: 'methodDefinition' -> true; yourself))}
]

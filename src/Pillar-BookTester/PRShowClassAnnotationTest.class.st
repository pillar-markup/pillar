Class {
	#name : #PRShowClassAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-BookTester-Annotations-Tests'
}

{ #category : #helpers }
PRShowClassAnnotationTest >> actualClass [
	^ PRShowClassAnnotation
]

{ #category : #helpers }
PRShowClassAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'class')
			valueNode: (PRParameterValue value: 'PRBookTestDummyShowClassAnnotation').
		}

]

{ #category : #helpers }
PRShowClassAnnotationTest >> referenceString [

	^ 'showClass:class=PRBookTestDummyShowClassAnnotation'
]

{ #category : #helpers }
PRShowClassAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: (annotation parameters at: #class) equals: 'PRBookTestDummyShowClassAnnotation'.
]

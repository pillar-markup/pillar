Class {
	#name : #PRShowMethodAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #helpers }
PRShowMethodAnnotationTest >> actualClass [
	^ PRShowMethodAnnotation
]

{ #category : #helpers }
PRShowMethodAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'method')
			valueNode: (PRParameterValue value: 'testDummyAnnotation').
		PRParameter 
			keyNode: (PRParameterKey named: 'class')
			valueNode: (PRParameterValue value: 'PRBookTestDummyShowMethodAnnotation'). 
		}
]

{ #category : #helpers }
PRShowMethodAnnotationTest >> referenceString [

	^ 'showMethod:method=testDummyAnnotation|class=PRBookTestDummyShowMethodAnnotation'
]

{ #category : #helpers }
PRShowMethodAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: (annotation parameters at: #class) equals: 'PRBookTestDummyShowMethodAnnotation'.
	self assert: (annotation parameters at: #method) equals: 'testDummyAnnotation'.
]

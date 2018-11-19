Class {
	#name : #PRRunAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-BookTester-Annotations-Tests'
}

{ #category : #helpers }
PRRunAnnotationTest >> actualClass [
	^ PRRunAnnotation
]

{ #category : #helpers }
PRRunAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'testClass')
			valueNode: (PRParameterValue value: 'PRBookTestDummyRunAnnotation').
		}
]

{ #category : #helpers }
PRRunAnnotationTest >> referenceString [

	^ 'run:testClass=PRBookTestDummyRunAnnotation'
			
]

{ #category : #helpers }
PRRunAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: (annotation parameters at: #testClass) equals: 'PRBookTestDummyRunAnnotation'.
]

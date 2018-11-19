Class {
	#name : #PRScreenshotAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-BookTester-Annotations-Tests'
}

{ #category : #helpers }
PRScreenshotAnnotationTest >> actualClass [
	^ PRScreenshotAnnotation 
]

{ #category : #helpers }
PRScreenshotAnnotationTest >> referenceParameters [
^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'class')
			valueNode: (PRParameterValue value: 'PRScreenshotAnnotationTest').
		PRParameter 
			keyNode: (PRParameterKey named: 'method')
			valueNode: (PRParameterValue value: 'referenceString').
		PRParameter 
			keyNode: (PRParameterKey named: 'caption')
			valueNode: (PRParameterValue value: 'The referenceString method').
		PRParameter 
			keyNode: (PRParameterKey named: 'width')
			valueNode: (PRParameterValue value: 50). 
		PRParameter 
			keyNode: (PRParameterKey named: 'label')
			valueNode: (PRParameterValue value: 'refStr').}
	
]

{ #category : #helpers }
PRScreenshotAnnotationTest >> referenceString [
	^ 'screenshot:class=PRScreenshotAnnotationTest|method=referenceString|caption=The referenceString method|width=50|label=refStr'
		
]

{ #category : #helpers }
PRScreenshotAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation className equals: 'PRScreenshotAnnotationTest'.
	self assert: annotation methodName equals: 'referenceString'.
	self assert: annotation caption equals: 'The referenceString method'.
	self assert: annotation width equals: 50.
	self assert: annotation label equals: 'refStr'.
]

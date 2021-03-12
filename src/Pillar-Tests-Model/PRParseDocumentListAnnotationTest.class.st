Class {
	#name : #PRParseDocumentListAnnotationTest,
	#superclass : #PRParseAbstractAnnotationTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #helpers }
PRParseDocumentListAnnotationTest >> actualClass [
	^ PRDocumentListAnnotation
]

{ #category : #helpers }
PRParseDocumentListAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'path')
			valueNode: (PRParameterValue value: 'blogs').
		PRParameter 
			keyNode: (PRParameterKey named: 'limit')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'sort')
			valueNode: (PRParameterValue value: 'date').
		PRParameter 
			keyNode: (PRParameterKey named: 'templates')
			valueNode: (PRParameterValue value: #('templates/docArticle.mustache')).
		PRParameter
			keyNode: (PRParameterKey named: 'summaryMaxSize')
			valueNode: (PRParameterValue value: 500) }
]

{ #category : #helpers }
PRParseDocumentListAnnotationTest >> referenceString [
	^ 'docList:path=blogs|limit=10|sort=date|templates=#(''templates/docArticle.mustache'')|summaryMaxSize=500'
]

{ #category : #helpers }
PRParseDocumentListAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation path equals: 'blogs'.
	self assert: annotation limit equals: 10.
	self assert: annotation sort equals: 'date'.
	self assert: annotation templates equals: #('templates/docArticle.mustache').
]

Class {
	#name : #PRDocumentListAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document-List'
}

{ #category : #helpers }
PRDocumentListAnnotationTest >> actualClass [
	^ PRDocumentListAnnotation
]

{ #category : #helpers }
PRDocumentListAnnotationTest >> referenceParameters [
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
PRDocumentListAnnotationTest >> referenceString [
	^ 'docList:path=blogs|limit=10|sort=date|templates=#(''templates/docArticle.mustache'')|summaryMaxSize=500'
]

{ #category : #helpers }
PRDocumentListAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation path equals: 'blogs'.
	self assert: annotation limit equals: 10.
	self assert: annotation sort equals: 'date'.
	self assert: annotation templates equals: #('templates/docArticle.mustache').
]

Class {
	#name : 'PRDocumentListAnnotationTest',
	#superclass : 'PRAbstractAnnotationTest',
	#category : 'Pillar-Tests-Model-Document-List',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document-List'
}

{ #category : 'helpers' }
PRDocumentListAnnotationTest >> actualClass [
	^ PRDocumentListAnnotation
]

{ #category : 'helpers' }
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

{ #category : 'helpers' }
PRDocumentListAnnotationTest >> referenceString [
	^ 'docList:path=blogs|limit=10|sort=date|templates=#(''templates/docArticle.mustache'')|summaryMaxSize=500'
]

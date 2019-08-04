Class {
	#name : #PRLoaderAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #helpers }
PRLoaderAnnotationTest >> actualClass [
	^ PRLoaderAnnotation
]

{ #category : #helpers }
PRLoaderAnnotationTest >> referenceParameters [
	
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'account')
			valueNode: (PRParameterValue value: 'QDucasse').
		PRParameter 
			keyNode: (PRParameterKey named: 'project')
			valueNode: (PRParameterValue value: 'MetacelloTestBook-Code').
		PRParameter 
			keyNode: (PRParameterKey named: 'tag')
			valueNode: (PRParameterValue value: 'Chapter1').
		PRParameter 
			keyNode: (PRParameterKey named: 'baseline')
			valueNode: (PRParameterValue value: 'MetacelloTestBook') 
		}

]

{ #category : #helpers }
PRLoaderAnnotationTest >> referenceString [

	^ 'loader:account=QDucasse|project=MetacelloTestBook-Code|tag=Chapter1|baseline=MetacelloTestBook'
	
]

{ #category : #helpers }
PRLoaderAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation account equals: 'QDucasse'.
	self assert: annotation project equals: 'MetacelloTestBook-Code'.
	self assert: annotation baseline equals: 'MetacelloTestBook'.
	self assert: annotation gitTag equals: 'Chapter1'.
]

Class {
	#name : #PRInputFileAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#instVars : [
		'directory'
	],
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRInputFileAnnotationTest >> actualClass [
	^ PRInputFileAnnotation
]

{ #category : #helpers }
PRInputFileAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'path')
			valueNode: (PRParameterValue value: 'foo/myFile.pillar') }
]

{ #category : #helpers }
PRInputFileAnnotationTest >> referenceString [
	^ 'inputFile:path=foo/myFile.pillar'
]

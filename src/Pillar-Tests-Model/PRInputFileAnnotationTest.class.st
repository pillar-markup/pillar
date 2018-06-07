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
	^ OrderedDictionary new
		add: 'value' -> 'foo/myFile.pillar';
		yourself
]

{ #category : #helpers }
PRInputFileAnnotationTest >> referenceString [
	^ 'inputFile:value=foo/myFile.pillar'
]

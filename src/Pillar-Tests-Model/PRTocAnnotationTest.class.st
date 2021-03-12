Class {
	#name : #PRTocAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-Model-Toc'
}

{ #category : #helpers }
PRTocAnnotationTest >> actualClass [
	^ PRTocAnnotation
]

{ #category : #helpers }
PRTocAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'depthLevel')
			valueNode: (PRParameterValue value: 2).
		PRParameter 
			keyNode: (PRParameterKey named: 'level')
			valueNode: (PRParameterValue value: 3) }
]

{ #category : #helpers }
PRTocAnnotationTest >> referenceString [
	^ 'toc:depthLevel=2|level=3'
]

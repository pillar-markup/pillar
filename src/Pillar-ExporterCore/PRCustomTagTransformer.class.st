Class {
	#name : #PRCustomTagTransformer,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #helper }
PRCustomTagTransformer >> createNewCitationWith: documentItem [

	^ PRCitation ref: (documentItem parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
]

{ #category : #'visiting-annotations' }
PRCustomTagTransformer >> visitCitationAnnotation: aCitationAnnotation [

	self replace: (OrderedCollection with: (self createNewCitationWith: aCitationAnnotation)).
	super visitCitationAnnotation: aCitationAnnotation 
]

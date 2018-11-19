"
I am a transformer which will replace the citation annotations  by a real citation structure.
"
Class {
	#name : #PRCitationTransformer,
	#superclass : #PRNodeTransformer,
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #helper }
PRCitationTransformer >> createNewCitationWith: documentItem [

	^ PRCitation ref: (documentItem parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
]

{ #category : #'visiting-annotations' }
PRCitationTransformer >> visitCitationAnnotation: aCitationAnnotation [

	self replace: (OrderedCollection with: (self createNewCitationWith: aCitationAnnotation)).
	super visitCitationAnnotation: aCitationAnnotation 
]

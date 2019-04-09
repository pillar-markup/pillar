"
I am a transformer which will replace the citation annotations  by a real citation structure.
"
Class {
	#name : #PRCitationTransformer,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #helper }
PRCitationTransformer >> createNewCitationWith: aCitationAnnotation [

	^ PRCitation ref: (aCitationAnnotation parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
]

{ #category : #'visiting-annotations' }
PRCitationTransformer >> visitCitationAnnotation: aCitationAnnotation [

	self replace: (OrderedCollection with: (self createNewCitationWith: aCitationAnnotation)).
	super visitCitationAnnotation: aCitationAnnotation 
]

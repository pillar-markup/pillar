"
I am a transformer which will replace the citation annotations  by a real citation structure.
"
Class {
	#name : #PRCitationTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'tmpCitation'
	],
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #helper }
PRCitationTransformer >> createNewCitationWith: documentItem [

	tmpCitation := PRCitation ref: (documentItem parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
]

{ #category : #'visiting-annotations' }
PRCitationTransformer >> visitCitationAnnotation: aCitationAnnotation [

	self createNewCitationWith: aCitationAnnotation.
	self replace: (OrderedCollection with: tmpCitation).
	super visitCitationAnnotation: aCitationAnnotation 
]

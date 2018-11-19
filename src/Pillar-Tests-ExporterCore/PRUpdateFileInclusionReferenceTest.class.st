Class {
	#name : #PRUpdateFileInclusionReferenceTest,
	#superclass : #PRVisitorTest,
	#category : 'Pillar-Tests-ExporterCore'
}

{ #category : #private }
PRUpdateFileInclusionReferenceTest >> actualClass [
	^PRUpdateFileInclusionReference 
]

{ #category : #private }
PRUpdateFileInclusionReferenceTest >> testNewReferenceFor [
	|figure result expected |
	figure := PRFigure new reference: 'file://foo.pillar'.
	result := self actualClass start: figure with: 'bar'.
	expected := PRFigure new reference: 'file://bar/foo.pillar'.
	
	self assert: result equals: expected
]

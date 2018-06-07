"
Convert from the level of a Pillar heading to the level of heading in the exported document. For example, a ==headingLevelOffset== of 3 converts a 1st level Pillar heading to an ==<h4>== in HTML.
"
Class {
	#name : #PRHeadingLevelOffset,
	#superclass : #PRNodeTransformer,
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #'visiting-document' }
PRHeadingLevelOffset >> visitHeader: aHeader [
	aHeader level: aHeader level + self configuration headingLevelOffset
]

"
Convert from the level of a Pillar heading to the level of heading in the exported document. For example, a ==headingLevelOffset== of 3 converts a 1st level Pillar heading to an ==<h4>== in HTML.
"
Class {
	#name : #PRHeadingLevelOffsetTransformer,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #visiting }
PRHeadingLevelOffsetTransformer >> start: aPRDocument [
	| conf |
	conf := ConfigurationForPillar newFromDictionary: aPRDocument properties.
	conf parent: self configuration.
	self configuration: conf.
	super start: aPRDocument.
	^ aPRDocument
]

{ #category : #'visiting-document' }
PRHeadingLevelOffsetTransformer >> visitHeader: aHeader [

	aHeader level: aHeader level + self configuration headingLevelOffset
]

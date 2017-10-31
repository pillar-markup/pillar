instance creation
sortedDescriptionsFor: anAnnotation
	"I return the sorted descriptions of an Annotation in order to keep the right order for the parameters. If one day the Pillar exporter become a normalizer and not an exact exporter just return ==anAnnotation magritteDescription children=="

	| sortedDescriptions descriptions |
	descriptions := anAnnotation magritteDescription children.
	sortedDescriptions := OrderedCollection new.
	anAnnotation parameters keysDo: [ :key | sortedDescriptions addAll: (descriptions select: [ :description | description accessor readSelector = key ]) ].
	^ sortedDescriptions
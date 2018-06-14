parsing
getFirstElementsOf: aFileReference
	| doc |
	doc := PRPillarParser parse: aFileReference readStream.
	^ doc children first: 3
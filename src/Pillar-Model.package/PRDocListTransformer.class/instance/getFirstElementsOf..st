parsing
getFirstElementsOf: aFileReference
	| doc |
	"arbitrary value, we have to check for that after"
	doc := PRPillarParser parse: aFileReference readStream.
	^ doc children first: 3
parsing
getFirstElementsOf: aFileReference
	| doc conf |
	"arbitrary value, we have to check for that after"
	doc := PRPillarParser parse: aFileReference contents.
	conf := ConfigurationForPillar newFromDictionary: doc properties.
	^ doc children first: 3
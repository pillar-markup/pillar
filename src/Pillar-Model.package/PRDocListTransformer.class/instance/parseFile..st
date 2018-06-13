parsing
parseFile: aFileReference

	| doc |
	
	doc := PRPillarParser parse: aFileReference readStream.

	^ doc children first: 4
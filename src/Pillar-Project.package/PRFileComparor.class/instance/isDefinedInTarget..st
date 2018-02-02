accessing
isDefinedInTarget: first
	^ (target / (first path relativeTo: origin path) pillarPrintString) exists
	
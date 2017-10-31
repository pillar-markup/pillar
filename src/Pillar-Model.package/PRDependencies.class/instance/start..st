visiting
start: aDocument
	cachedDependencies := Set new.
	super start: aDocument.
	^ cachedDependencies.
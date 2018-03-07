visiting
start: anObject

	"Execute column annotation before"
	super start: (PRColumnsTransformer new start: anObject).
	^ anObject
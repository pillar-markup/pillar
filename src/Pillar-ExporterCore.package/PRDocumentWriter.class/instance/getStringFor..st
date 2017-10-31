helpers
getStringFor: anObject
	"Visit anObject and exports everything to a new stream. Answer the stream content."
	^ self getStringForAll: { anObject }
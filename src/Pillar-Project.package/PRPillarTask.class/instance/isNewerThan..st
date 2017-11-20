testing
isNewerThan: aTime
	
	"I have changes newer than a time if
	 - I was never executed,
	 - or my actual modification time is newer than the time"
	self isAlreadyDone ifFalse: [ ^ true ].
	
	^ self modificationTime > aTime
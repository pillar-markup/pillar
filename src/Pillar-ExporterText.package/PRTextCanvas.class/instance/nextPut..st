writing text
nextPut: aCharacter
	super nextPut: aCharacter.
	lastIsNewLine := false
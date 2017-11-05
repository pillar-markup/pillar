writing text
nextPut: aCharacter
	(PillarCharacters at: aCharacter ifAbsent: nil) 
		ifNil: [ super nextPut: aCharacter ] 
		ifNotNil: [ :string | self raw: string ].
	lastIsNewLine := false
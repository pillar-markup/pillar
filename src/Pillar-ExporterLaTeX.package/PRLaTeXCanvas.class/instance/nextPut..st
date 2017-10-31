writing text
nextPut: aCharacter
	| string |
	string := LatexCharacters at: aCharacter ifAbsent: nil.
	string isNil
		ifTrue: [ super nextPut: aCharacter ]
		ifFalse: [ self raw: string ]
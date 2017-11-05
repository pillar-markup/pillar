parsing
parse: stdin on: documents
	| input |
	stdin atEnd
		ifTrue: [ ^ self errorNoInputFile ].
	input := String
		streamContents: [ :s | [ stdin atEnd ] whileFalse: [ stdin next ifNotNil: [ :char | s nextPut: char ] ] ].
	documents add: (PRDocument parser parse: input)
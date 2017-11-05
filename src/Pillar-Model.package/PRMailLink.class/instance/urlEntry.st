accessing-dynamic
urlEntry
	^ String streamContents: [ :stream |
		super urlEntry do: [ :each |
			(1 to: 2) atRandom = 1
				ifTrue: [ stream nextPut: each ]
				ifFalse: [ stream nextPut: $%; nextPutAll: ((each codePoint printStringBase: 16)
		padLeftTo: 2 with: $0) ] ] ]
accessing
headerSize: anInteger
	"Pay attention changing the size only makes sense when numbering is true."
	numbering
		ifTrue: [ size := anInteger ]
		ifFalse: [ size := 0 ].
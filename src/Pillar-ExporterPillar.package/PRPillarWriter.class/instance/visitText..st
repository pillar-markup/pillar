visiting-document
visitText: anObject
	"Write out ==anObject=='s text to the receivers output-stream and escape special characters within and at the beginning of a line."

	| string |
	string := anObject text.
	writingRaw
		ifTrue: [ 
			canvas rawLines: string.
			^ self ].
	canvas lastIsNewLine
		ifTrue:
			[ 
			| markup |
			markup := PRPillarParser lineMarkups values detect: [ :each | string beginsWithSubCollection: each ] ifNone: [ nil ].
			markup isNil
				ifFalse: [ 
					canvas
						nextPut: $\;
						raw: markup.
					string := string allButFirst: markup size ] ].
	canvas raw: (self escape: string)
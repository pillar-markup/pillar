visiting-document
visitText: aText
	writingRaw
		ifTrue: [ canvas rawLines: aText text ]
		ifFalse: [ canvas nextPutAllLines: aText text ]
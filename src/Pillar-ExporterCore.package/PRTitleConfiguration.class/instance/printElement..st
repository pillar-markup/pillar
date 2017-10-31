rendering-element
printElement: aNumber
	^ aNumber = -1
		ifTrue: [ '' ]
		ifFalse: [ self renderElement: aNumber ]
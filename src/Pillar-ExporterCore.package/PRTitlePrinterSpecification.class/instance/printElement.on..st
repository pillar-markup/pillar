rendering-element
printElement: aNumber on: stream
	aNumber = -1
		ifFalse: [ self renderElement: aNumber on: stream ]
accessing-dynamic
text
	| text |
	^ (text := super text) isEmpty 
		ifTrue: [ self reference ]
		ifFalse: [ text ]
visiting
start: anObject
	nesting := OrderedCollection new.
	super start: anObject.
	canvas lastIsNewLine
		ifTrue: [ stream trimLastNewLine ]
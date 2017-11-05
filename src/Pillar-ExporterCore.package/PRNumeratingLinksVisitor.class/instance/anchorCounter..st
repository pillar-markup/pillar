accessing
anchorCounter: aString
	^ anchorsMapping at: aString ifAbsent: [ self cantFindCounterNamed: aString for: 'anchor' ]
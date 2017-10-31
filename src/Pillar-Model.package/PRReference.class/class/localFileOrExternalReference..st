private
localFileOrExternalReference: aString
	| localFileIndicator |
	localFileIndicator := 'file://'.
	^ (aString beginsWith: localFileIndicator)
			ifTrue: [ aString allButFirst: localFileIndicator size ]
			ifFalse: [ aString ]
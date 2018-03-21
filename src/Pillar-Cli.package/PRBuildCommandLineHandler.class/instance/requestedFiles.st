activation
requestedFiles

	| nonOptions |
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions allButFirst
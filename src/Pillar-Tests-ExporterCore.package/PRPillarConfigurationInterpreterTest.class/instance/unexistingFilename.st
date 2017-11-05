helpers
unexistingFilename
	| name |
	name := 'foo'.
	[ name asFileReference exists] whileTrue: [ name := name, 'a' ].
	^ name
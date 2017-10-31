system
createSymbolic: name to: target
	| command |
	command :='ln -sf ' , target , ' ' , name.
	name asFileReference exists
		ifTrue: [ command := 'unlink ', name , '; ' , command ].
	self system: command
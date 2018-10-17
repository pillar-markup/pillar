accessing
start

	Stdio stdout nextPutAll: 'Watching: true';lf.
	process := [ [true] whileTrue: [ 
		3 seconds wait.
		self generateHtml. ]] fork
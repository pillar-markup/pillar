accessing
start

	FileStream stdout nextPutAll: 'Watching: true';lf.
	process := [ [true] whileTrue: [ 
		5 seconds wait.
		self generateHtml. ]] fork
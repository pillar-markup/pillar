running
createFile4
	| stream |
	(directory / 'tata') ensureCreateDirectory.
	stream := (directory / 'tata' / 'toto.pillar') writeStream.
	stream nextPutAll: '+fig.png|width=50+'.
	stream close
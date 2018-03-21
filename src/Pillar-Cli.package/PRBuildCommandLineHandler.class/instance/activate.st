activation
activate
	
	| target |
	target := PRTarget builderForName: self requestedBuilder.
	self requestedFiles
		ifEmpty: [ target buildAll ]
		ifNotEmpty: [ :files | target buildOnly: files ].
	self project build: target.
	self exitSuccess
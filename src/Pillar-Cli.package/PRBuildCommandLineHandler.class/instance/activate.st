activation
activate
	
	| target result |
	target := PRTarget builderForName: self requestedBuilder.
	self requestedFiles
		ifEmpty: [ target buildAll ]
		ifNotEmpty: [ :files | target buildOnly: files ].
	result := self project build: target.
	result exitProcess
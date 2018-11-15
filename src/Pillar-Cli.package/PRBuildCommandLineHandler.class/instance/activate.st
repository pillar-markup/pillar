activation
activate
	
	| target result |
	target := PRTarget builderForName: self requestedBuilder.
	self requestedFiles
		ifEmpty: [ target buildAll ]
		ifNotEmpty: [ :files | target buildOnly: files ].
	(self hasOption: 'templatable')
		ifTrue: [ self project beTemplatable ].
	result := self project build: target.
	result exitProcess
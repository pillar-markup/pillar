accessing
command

	| command |
	command := self newCommand.
	command configurationFileName: self configurationFileName.
	command workingDirectory: self workingDirectory.
	command extraArguments: self extraArguments.
	^ command
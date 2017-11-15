execution
executeOnWindowsCommand: command arguments: arguments workingDirectory: aWorkingDirectory
	| process commandString success |
	
	commandString := 'cd "{workingDirectory}" && {command} {argumentsString}' format: {
		'workingDirectory' -> aWorkingDirectory asString.
		'command' -> command asString.
		'argumentsString' -> (' ' join: (arguments collect: [ :each | '"', each asString, '"' ]) )
	} asDictionary.
	
	process := ProcessWrapper new.
	success := (process startWithShellCommand: commandString).
	success ifFalse: [
		self error: 'command ', command ,' failed' ].

	success := process waitForExit.
	success ifFalse: [
		self error: 'command ', command ,' failed' ].
	
	process exitCode = 0 ifFalse: [
		self error: 'command ', command ,' failed' ]
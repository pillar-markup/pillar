execution
executeCommand: command arguments: arguments workingDirectory: aWorkingDirectory

	OSPlatform current isWindows ifTrue: [ 
		^ self
			executeOnWindowsCommand: command
			arguments: arguments
			workingDirectory: aWorkingDirectory
	].
	^ self
		executeOnUnixCommand: command
		arguments: arguments
		workingDirectory: aWorkingDirectory
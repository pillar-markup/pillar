execution
executeOnUnixCommand: command arguments: arguments workingDirectory: aWorkingDirectory
	| process |
	process := OSSUnixSubprocess new
		command: command;
		workingDirectory: aWorkingDirectory;
		arguments: arguments;
		runAndWait.
	process isSuccess ifFalse: [
		self error: 'command ', command ,' failed' ]
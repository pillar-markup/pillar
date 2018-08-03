command line
checkBook
	<commandline>

	^ (ClapCommand withName: 'checkBook')
		description: 'Checks the examples and the correct compilation of methods and classes defined in the book/chapter';
		addPositional: ((ClapPositional withName: 'path') defaultMeaning: [ FileSystem workingDirectory / 'index.pillar' ]);
			description: 'Path to the targetted book/chapter. Default: current directory';
		"the default positional is the current directory"
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help |
				help value; exitSuccess ].
			
				(self with: args) checkBook	] 
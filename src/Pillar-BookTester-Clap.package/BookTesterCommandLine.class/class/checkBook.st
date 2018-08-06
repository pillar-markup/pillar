command line
checkBook
	<commandline>

	^ (ClapCommand withName: 'checkBook')
		description: 'Checks the examples and the correct compilation of methods and classes defined in the book/chapter';
		addPositional: ((ClapPositional withName: 'path') defaultMeaning: 
										[ (FileSystem workingDirectory childrenMatching: '*.pillar') first  ]);
			description: 'Path to the targetted book/chapter. Default: index.pillar in the current directory';
		"the default positional is index/pillar in the current directory"
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help |
				help value; exitSuccess ].
			
				(self with: args) checkBook	] 
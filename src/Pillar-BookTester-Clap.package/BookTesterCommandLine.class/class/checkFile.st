command line
checkFile
	<commandline>

	^ (ClapCommand withName: #checkFile)
		description: 'Checks the examples and the correct compilation of methods and classes defined in the chapter (pillar file)';
		add: ClapFlag forHelp;
		addPositional: ((ClapPositional withName: 'path') 
		   defaultMeaning: [ (FileSystem workingDirectory childrenMatching: '*.pillar') first  ];
			description: 'Path to the targetted chapter. 
							  Default: first *.pillar in the current directory');
		"the default positional is index/pillar in the current directory"
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help |
				help value; exitSuccess ].
			
				(self with: args) checkFile	] 
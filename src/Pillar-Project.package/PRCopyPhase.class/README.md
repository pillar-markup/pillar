I am a helper file that is used to copy all files in the  _support directory from the base directory to the output directory.

I am made in such a way that I do not fail if a file already exists, but I rather ignore it.

	(PRCopyPhase directory: '_support')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).
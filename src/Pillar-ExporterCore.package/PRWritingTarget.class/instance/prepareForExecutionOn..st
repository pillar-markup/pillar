preparation
prepareForExecutionOn: aPRProject 

	| configuration outputDirectory |
	
	"As a temporary solution, remove the old results folder before building the document.
	This should be replaced by a smarter solution replacing only modified files"
	aPRProject wipeout.
	
	configuration := (PRPillarConfiguration newFromDictionary: {
		#_outputFormat -> self.
	} asDictionary)
		parent: aPRProject configuration;
		yourself.
	
	(PRCopyPhase directory: '_support')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).

	outputDirectory := configuration outputDirectory / self outputDirectoryName.
	configuration baseDirectory children do: [ :each |
		((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ]) ifFalse: [ 
			each copyAllTo: outputDirectory / each basename ] ].
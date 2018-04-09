accessing
prepareForExecutionOn: aPRProject 

	"As a temporary solution, remove the old results folder before building the document.
	This should be replaced by a smarter solution replacing only modified files"
	| configuration outputFormat target source |
	aPRProject wipeout.
	
	configuration :=  self createConfigurationFrom: aPRProject.
	
	outputFormat := configuration propertyAt: #_outputFormat.
	target := aPRProject outputDirectory  / outputFormat outputDirectoryName resolve: (Path from: '_support').
	source := aPRProject baseDirectory /  '_support'.
	
	PRCopyPhase new
		sourceDirectory: source;
		destinationDirectory: target;
		executeOn: nil "We used a configuration context here that is not needed anymore".
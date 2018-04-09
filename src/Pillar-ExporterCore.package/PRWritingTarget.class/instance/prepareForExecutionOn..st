preparation
prepareForExecutionOn: aPRProject
	| configuration outputDirectory outputFormat target source |
	"As a temporary solution, remove the old results folder before building the document.
	This should be replaced by a smarter solution replacing only modified files"
	aPRProject wipeout.
	configuration := self createConfigurationFrom: aPRProject.
	
	outputFormat := configuration propertyAt: #_outputFormat.
	target := aPRProject outputDirectory  / outputFormat outputDirectoryName resolve: (Path from: '_support').
	source := aPRProject baseDirectory /  '_support'.
	
	PRCopyPhase new
		sourceDirectory: source;
		destinationDirectory: target;
		executeOn: nil "We used a configuration context here that is not needed anymore".
		
	outputDirectory := aPRProject outputDirectory / self outputDirectoryName.
	aPRProject baseDirectory children
		do: [ :each | 
			((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ])
				ifFalse: [ each copyAllTo: outputDirectory / each basename ] ]
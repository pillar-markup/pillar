actions
actionOn: anInput
	| writer output |
	"We create the directories before the files to avoir a FileDoesNotExistException."
	self configuration: anInput configuration.
	writer := self instantiateWriter
		configuration: self configuration;
		yourself.
	self configuration outputFile isStream
		ifFalse: [ self configuration
				outputFile: (self configuration outputFile withExtension: writer fileExtension) ].
	output := self write: anInput input using: writer.
	^ output
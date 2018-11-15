writing
writer
	
	"If templating is active in the command, use the templated writer"
	| writer |
	writer := self basicWriter.
	project isTemplatable ifTrue: [ 
		writer := PRTemplatedWriter new
			outputDocument: self;
			defaultWriter: writer;
			yourself ].
	^ writer
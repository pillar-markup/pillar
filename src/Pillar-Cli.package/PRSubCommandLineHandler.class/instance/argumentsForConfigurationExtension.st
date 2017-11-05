private
argumentsForConfigurationExtension
	"return a dictionary composed out of the arguments passed on the command line"
	| dict |
	dict := Dictionary new.
	self arguments
		do: [ :commandLineArgPair | 
				"in the form of --to='LaTeX'"
				(commandLineArgPair beginsWith: '--')
					ifTrue: [ self add: commandLineArgPair to: dict ] ].
	dict 
		at: 'inputFile' 
		ifAbsent: [ dict at: 'inputFile' put: self arguments last ].
	self class argumentsOutOfConfiguration 
		do: [ :each | dict removeKey: each ifAbsent: [ ] ].
	^ dict
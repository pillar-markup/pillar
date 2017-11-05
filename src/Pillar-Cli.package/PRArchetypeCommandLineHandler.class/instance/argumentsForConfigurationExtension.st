activation
argumentsForConfigurationExtension
	"return a dictionary composed out of the arguments passed on the command line"
	| dict |
	dict := Dictionary new.
	self arguments
		do: [ :commandLineArgPair | 
				"in the form of --to='LaTeX'"
				(commandLineArgPair beginsWith: '--')
					ifTrue: [ self add: commandLineArgPair to: dict ] ].
	"also managed ./pillar archetype book (to be backward compatible)"
	self arguments size = 2
		ifTrue: [ self add: '--template=', self arguments last to: dict ].
	self class argumentsOutOfConfiguration 
		do: [ :each | dict removeKey: each ifAbsent: [ ] ].
	^ dict
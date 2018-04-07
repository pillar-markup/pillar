conversion
convertLevels: aValue
	"generated code"
	| elements |
	elements := OrderedCollection new.
	aValue do: [:v | 
		 elements add: (self convertLevelSpecification: v ) ].
	^ elements
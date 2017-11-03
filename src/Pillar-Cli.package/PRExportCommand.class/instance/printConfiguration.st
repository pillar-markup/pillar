parsing
printConfiguration
	"self stdout << subconfName.
	self stdout lf."
	configuration properties keysAndValuesDo: [ :key :value | self stdout << key << ' = ' << value printString; lf ]
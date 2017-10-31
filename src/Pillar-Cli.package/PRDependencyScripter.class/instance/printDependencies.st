printing
printDependencies
	| path pathWithoutFile |
	path := self inputFile pathString substrings: '/'.
	pathWithoutFile := path allButLast
		inject: ''
		into: [ :substring :next | substring , next , '/' ].
	Stdio stdout << 'Dependency analysis report: '.
	self dependencies
		do: [ :each | 
			Stdio stdout
				<< './';
				<< pathWithoutFile;
				<< each;
				<< ' ' ].
	Stdio stdout flush
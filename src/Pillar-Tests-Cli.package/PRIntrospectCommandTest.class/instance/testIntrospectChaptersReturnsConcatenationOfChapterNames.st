tests
testIntrospectChaptersReturnsConcatenationOfChapterNames

	| command |
	command := self introspectorWithConfiguredAttribute: 'chapters' -> #( c1 c2 c3 ).
	self assert: (command introspect: 'chapters') equals: 'c1 c2 c3'
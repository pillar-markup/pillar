tests-parsing
testParseMixed
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '#1' , nLine , '#2' , nLine , '-3'.
	tree := PRDocument new
		add:
				(PROrderedList new
						add: (self listItemWithText: '1');
						add: (self listItemWithText: '2');
						yourself);
		add:
				(PRUnorderedList new
						add: (self listItemWithText: '3');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
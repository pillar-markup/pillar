tests-parsing
testParseProperties
	| wiki text tree document |
	wiki := '{''title'':''The title''}'.
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
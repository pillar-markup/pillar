tests-parsing
testParseSimpleOn1Line
	"This test does *not* specify a valid usage of script. This test is here to ensure that there is a sensible default when writing invalid Pillar text."
	| wiki text tree |
	wiki := '[[[foo]]]'.
	text := '[[[foo]]]'.
	tree := PRDocument new
		add: (self addText: '[[[foo]]]' to: PRParagraph new);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	
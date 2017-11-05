tests
testHasCaption
	self deny: PRFigure new hasCaption.
	self assert: (self addText: 'foo' to: PRFigure new) hasCaption
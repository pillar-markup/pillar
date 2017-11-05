tests
testFigureCaptionWithNonTextChildren
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (self addText: 'foo' to: PRBoldFormat new);
		yourself.
	self assertWriting: item includesText: self boldFoo
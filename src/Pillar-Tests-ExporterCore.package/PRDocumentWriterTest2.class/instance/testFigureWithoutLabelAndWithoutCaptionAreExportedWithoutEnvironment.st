tests
testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment
	| item result |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	result := self write: item.
	self figureBegin ifNotEmpty: [ self deny: (result includesSubstring: self figureBegin) ]
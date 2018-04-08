tests
testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment
	| item result |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	result := self write: item.
	self assert: (result includesSubstring: self figureBegin)
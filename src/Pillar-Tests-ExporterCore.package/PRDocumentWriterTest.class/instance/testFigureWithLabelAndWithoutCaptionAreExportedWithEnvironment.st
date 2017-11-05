tests
testFigureWithLabelAndWithoutCaptionAreExportedWithEnvironment
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
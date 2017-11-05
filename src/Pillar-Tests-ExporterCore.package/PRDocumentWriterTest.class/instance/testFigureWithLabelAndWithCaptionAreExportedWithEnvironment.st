tests
testFigureWithLabelAndWithCaptionAreExportedWithEnvironment
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
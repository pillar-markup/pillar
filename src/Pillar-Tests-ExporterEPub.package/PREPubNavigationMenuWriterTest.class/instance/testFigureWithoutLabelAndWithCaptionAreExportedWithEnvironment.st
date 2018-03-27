tests
testFigureWithoutLabelAndWithCaptionAreExportedWithEnvironment
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		yourself.
	self assert: (self write: item) isEmpty
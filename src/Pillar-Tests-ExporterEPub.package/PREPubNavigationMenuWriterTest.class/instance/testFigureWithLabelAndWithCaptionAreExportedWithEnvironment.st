tests
testFigureWithLabelAndWithCaptionAreExportedWithEnvironment
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		label: 'label';
		yourself.
	self assert: (self write: item) isEmpty
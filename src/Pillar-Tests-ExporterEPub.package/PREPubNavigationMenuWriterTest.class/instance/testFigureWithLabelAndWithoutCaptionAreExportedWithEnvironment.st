tests
testFigureWithLabelAndWithoutCaptionAreExportedWithEnvironment
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'label';
		yourself.
	self assert: (self write: item) isEmpty
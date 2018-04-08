tests
testFigureWithWidth
	| item width |
	width := '50'.
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'width' put: width;
		yourself.
	self assertWriting: item includesText: self widthFor50percents
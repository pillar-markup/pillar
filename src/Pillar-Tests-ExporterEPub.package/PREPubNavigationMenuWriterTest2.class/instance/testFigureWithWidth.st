tests
testFigureWithWidth
	| item width |
	width := '50'.
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'width' put: width;
		yourself.
	self assert: (self write: item) isEmpty
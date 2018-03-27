tests
testFigure
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	self assert: (self write: item) isEmpty
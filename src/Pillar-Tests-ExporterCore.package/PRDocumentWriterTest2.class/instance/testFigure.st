tests
testFigure
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	self
		assertWriting: item
		includesText:
			'picture.png'
tests
testFigureLabelGenerateAnchor
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'label' put: 'pierLogo';
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self figureAnchorForPierLogo).
			'pierLogo'}
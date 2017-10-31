private
exportImgFor: aFigure
	| img |
	img := canvas emptyTag
		name: 'img';
		parameterAt: 'src' put: (aFigure localFileOrExternalReference);
		yourself.
	aFigure parameters
		at: 'width'
		ifPresent:
			[ :width | img parameterAt: 'width' put: width greaseString , '%' ].
	img closeTag
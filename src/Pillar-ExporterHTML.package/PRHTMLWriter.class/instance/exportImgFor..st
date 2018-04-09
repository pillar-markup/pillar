private
exportImgFor: aFigure
	| img |
	img := canvas emptyTag
		name: 'img';
		parameterAt: 'src' put: (aFigure localFileOrExternalReference);
		yourself.
	aFigure parameters
		at: 'width'
		ifPresent: [ :width | img parameterAt: 'width' put: width asString , '%' ].
	aFigure hasLabel ifTrue:[
		img
			parameterAt: 'id'
			put: aFigure label ].
	img
		parameterAt: 'alt'
		put: (aFigure hasChildren ifTrue: [ aFigure text ] ifFalse: [ '' ]).
	img closeTag
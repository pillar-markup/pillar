visiting-document
visitFigure: aFigure
	1halt.
	(aFigure hasLabel not and: [ aFigure hasCaption not ])
		ifTrue: [ 
			self exportImgFor: aFigure.
			^ self ].
	aFigure label ifNotNil: [ :label | self createAnchorWith: label ].
	canvas newLine.
	canvas tag
		name: 'figure';
		with:
				[ 
			canvas newLine.
			canvas nextPut: Character tab.
			self exportImgFor: aFigure.
			canvas newLine.
			canvas nextPut: Character tab.
			canvas tag
				name: 'figcaption';
				with:
						[ 
					aFigure label ifNotNil: [ self writeCounterForFigure: aFigure ].
					super visitFigure: aFigure ].
			canvas newLine ]
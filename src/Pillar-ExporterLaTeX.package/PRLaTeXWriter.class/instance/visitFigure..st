visiting-document
visitFigure: aFigure
	(aFigure hasCaption not and: [ aFigure hasLabel not ])
		ifTrue: [ 
			self includeGraphicsFor: aFigure.
			^ self ].
	canvas environment
		name: 'figure';
		with:
				[ 
			canvas environment
				name: 'center';
				with:
						[ 
					self includeGraphicsFor: aFigure.
					canvas command
						name: 'caption';
						parameter: [ 
							self
								writeCaptionOfExternalLink: aFigure;
								writeLabelOfExternalLink: aFigure ] ] ]
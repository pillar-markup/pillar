visiting-document
visitFigure: aFigure
	
	| parameters |
	parameters := Set  new.
	
	parameters add: (self searchParam: 'width' in: aFigure);
				  add: ('caption="', (self getStringForAll: aFigure children) ,'"').
		
	aFigure label ifNotNil: [ :label | self createAnchorWith: label ].
	
	canvas potentialNewLine;
			 surround: (aFigure localFileOrExternalReference) with: 'image::' and: '[',parameters asCommaString ,']'.
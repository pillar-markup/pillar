visiting-document
includeGraphicsFor: aFigure
	canvas command
		name: 'includegraphics';
		optParameter: [ self writeGraphicsParametersOfExternalLink: aFigure ];
		parameter: [ canvas raw: (aFigure localFileOrExternalReference) ]
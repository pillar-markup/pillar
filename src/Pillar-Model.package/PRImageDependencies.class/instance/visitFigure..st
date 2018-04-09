visiting-document
visitFigure: anObject 
	cachedDependencies add: anObject localFileOrExternalReference.
	super visitFigure: anObject.
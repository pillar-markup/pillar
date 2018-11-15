visiting
visitFigure: aFigure

	self
		write: aFigure
		withTemplateFileName: self figureTemplateFileName
		extraArguments: {
			'ref' -> aFigure localFileOrExternalReference.
			'caption' -> (aFigure hasChildren ifTrue: [ aFigure text ] ifFalse: [ '' ]) }
		ifAbsent: [ defaultWriter visitFigure: aFigure ]
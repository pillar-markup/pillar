visiting-document
visitFigure: aFigure
	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"

	aFigure label
		ifNotNil: [ 
			figureCounter incrementAt: 2.
			aFigure counter: figureCounter current.
			aFigure parameters at: 'label' ifPresent: [ :label | anchorsMapping at: label put: figureCounter current ] ]
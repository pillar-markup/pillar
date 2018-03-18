visiting-document
visitCodeblock: aCodeBlock
	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"

	aCodeBlock isEvaluated
		ifTrue: [ ^ self visitAll: aCodeBlock evaluate ].
	aCodeBlock hasLabel
		ifTrue: [ 
			scriptCounter incrementAt: 2.
			aCodeBlock counter: scriptCounter current.
			aCodeBlock parameters at: 'label' ifPresent: [ :label | anchorsMapping at: label put: scriptCounter current ] ]
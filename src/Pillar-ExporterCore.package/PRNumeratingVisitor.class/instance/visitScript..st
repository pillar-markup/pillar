visiting-document
visitScript: aScript
	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"

	aScript isEvaluated
		ifTrue: [ ^ self visitAll: aScript evaluate ].
	aScript hasLabel
		ifTrue: [ 
			scriptCounter incrementAt: 2.
			aScript counter: scriptCounter current.
			aScript parameters at: 'label' ifPresent: [ :label | anchorsMapping at: label put: scriptCounter current ] ]
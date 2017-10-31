visiting-document
visitTable: aTable
	| environment |
	environment := canvas environment name: 'tabular'.
	aTable rowCount = 0
		ifTrue: [ 
			environment with: [  ].
			^ self ].
	environment parameter: aTable latexSpecification.
	environment
		with: [ 
			canvas command name: 'toprule'.
			canvas newLine.
			super visitTable: aTable.
			canvas command name: 'bottomrule'.
			canvas newLine ]
grammar - Reference
figureAlias
	^ super figureAlias
		==>
			[ :string | 
			string
				ifEmpty: [ {(PRText content: '')} ]
				ifNotEmpty: [ self parse: string startingAt: #oneLineContent ] ]
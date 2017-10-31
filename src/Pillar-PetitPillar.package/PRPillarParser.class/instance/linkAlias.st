grammar - Reference
linkAlias
	^ super linkAlias
		==>
			[ :string | 
			string
				ifEmpty: [ {(PRText content: '')} ]
				ifNotEmpty: [ self parse: string startingAt: #oneLineContent ] ]
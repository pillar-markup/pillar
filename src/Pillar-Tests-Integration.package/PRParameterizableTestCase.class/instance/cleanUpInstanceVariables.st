private-parameterizable
cleanUpInstanceVariables
	| instVarsToKeep |
	instVarsToKeep := #( 'testSelector' 'testArguments' ).
	self class allInstVarNames do: [ :name |
		(instVarsToKeep includes: name) ifFalse: [
			self instVarNamed: name put: nil ] ]
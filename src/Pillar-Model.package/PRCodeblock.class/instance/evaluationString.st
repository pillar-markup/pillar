comparing
evaluationString
	^ String
		streamContents: [ :stream | 
			| evaluator |
			evaluator := PRScriptEvaluationEnvironment new
				setStream: stream;
				yourself.
			[ Compiler evaluate: self text for: evaluator logged: false ]
				on: Error
				do: [ :e | 
					stream
						nextPutAll: '= ';
						nextPutAll: e description ] ]
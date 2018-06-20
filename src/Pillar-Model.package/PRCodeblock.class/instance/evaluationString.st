comparing
evaluationString
	^ String
		streamContents: [ :stream | 
			| evaluator |
			evaluator := PRScriptEvaluationEnvironment new
				setStream: stream;
				yourself.
			[ self class compiler
				source: self text;
				logged: false;
				receiver: evaluator;
				evaluate ]
				on: Error
				do: [ :e | 
					stream
						nextPutAll: '= ';
						nextPutAll: e description ] ]
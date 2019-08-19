Extension { #name : #PRCodeblock }

{ #category : #'*Pillar-CodeBlockEvaluator' }
PRCodeblock >> evaluate [
	| content |
	content := self evaluationString.
	^ [ (PRDocument parser parse: content) children ]
		on: Error
		do: [ :e | PRBoldFormat with: (PRText content: e messageText) ]
]

{ #category : #'*Pillar-CodeBlockEvaluator' }
PRCodeblock >> evaluationString [
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
]

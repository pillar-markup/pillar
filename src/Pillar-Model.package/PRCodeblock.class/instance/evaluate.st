as yet unclassified
evaluate
	| content |
	content := self evaluationString.
	^ [ (PRDocument parser parse: content) children ]
		on: Error
		do: [ :e | PRBoldFormat with: (PRText content: e messageText) ]
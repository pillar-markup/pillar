actions
actionOn: aPillarContext
	| writer content output |
	writer := aPillarContext configuration outputType new.
	content := writer write: aPillarContext input.
	
	output := PROutputDocument new.
	output pillarDocument: aPillarContext input.
	output outputText: content.
	
	aPillarContext input: output.
	^ aPillarContext
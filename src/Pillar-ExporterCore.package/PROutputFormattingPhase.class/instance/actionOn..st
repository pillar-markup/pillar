actions
actionOn: aPillarContext
	| content output |
	content := (self writer writerFor: aPillarContext configuration) write: aPillarContext input.
	output := PROutputDocument new.
	output pillarDocument: aPillarContext input.
	output outputText: content.
	aPillarContext input: output.
	^ aPillarContext
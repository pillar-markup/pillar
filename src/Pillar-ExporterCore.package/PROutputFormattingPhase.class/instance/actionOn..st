actions
actionOn: aPillarContext
	| content output |
	content := self writer write: aPillarContext input.
	output := PROutputDocument new.
	output pillarDocument: aPillarContext input.
	output outputText: content.
	aPillarContext input: output.
	^ aPillarContext
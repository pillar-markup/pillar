execution
doExecute
	
	| content output |
	content := self writer write: self pillarDocument.
	output := PROutputDocument new.
	output pillarDocument: self pillarDocument.
	output outputText: content.
	^ output
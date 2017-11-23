execution
doExecute
	
	| inclusionVisitor |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: goal inputDocument file.
	inclusionVisitor expansionTask: self.
	^ inclusionVisitor start: self pillarDocument
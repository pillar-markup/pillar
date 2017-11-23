execution
doExecute
	
	| inclusionVisitor |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: goal inputDocument file.
	inclusionVisitor expansionTask: self.
	^ self result: (inclusionVisitor start: self pillarDocument)
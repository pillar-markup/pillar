execution
doExecute
	
	| inclusionVisitor |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: inputFile.
	inclusionVisitor expansionTask: self.
	^ inclusionVisitor start: self pillarDocument
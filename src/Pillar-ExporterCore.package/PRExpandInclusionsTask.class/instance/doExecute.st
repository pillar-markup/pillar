execution
doExecute
	
	| inclusionVisitor |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: inputFile.
	^ inclusionVisitor start: self pillarDocument
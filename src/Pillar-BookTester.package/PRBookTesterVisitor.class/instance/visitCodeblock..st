visiting
visitCodeblock: aCodeBlock
	
	codeblockDict keys anySatisfy: [ :k | 
						  (aCodeBlock perform: k) 
								ifTrue: [ self perform: (codeblockDict at: k) with: aCodeBlock] ]
	
	"possibleCodeblocks keys do: [ :any | (aCodeBlock any)
														ifTrue: [ (self possibleCodeblocks at: any) aCodeBlock ] ]"
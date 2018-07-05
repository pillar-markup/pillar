visiting
visitCodeblock: aCodeBlock
	
	codeblockDict keys do: [ :k | 
						  (aCodeBlock perform: k) 
								ifTrue: [ self perform: (codeblockDict at: k) with: aCodeBlock] ]

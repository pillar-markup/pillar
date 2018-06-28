visiting
visitCodeblock: aCodeBlock
	
	| result |
	possibleCodeblocks keys do: [ :any | (aCodeBlock any)
														ifTrue: [ (self possibleCodeblocks at: any) aCodeBlock ] ]
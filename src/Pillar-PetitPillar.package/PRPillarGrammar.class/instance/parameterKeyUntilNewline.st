grammar - Parameter
parameterKeyUntilNewline
	^	epsilonToken ,
		(self parameterKeyUntilParser: newline) , 
		epsilonToken
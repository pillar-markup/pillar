grammar - Parameter
parameterValueUntilNewline
	^ 	epsilonToken ,
		(self parameterValueUntilParser: newline) , 
		epsilonToken
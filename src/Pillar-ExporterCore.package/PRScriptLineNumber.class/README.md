I add line numbers to each script with ==lineNumber=true==.

[[[lineNumber=true
	
	
	
	
	
]]]

S. Ducasse: String new writeStream is no correct because imagine that we are on mac and we want to produce document for windows... We should not output mac end of line. This is why PROutputStream should be used instead. 
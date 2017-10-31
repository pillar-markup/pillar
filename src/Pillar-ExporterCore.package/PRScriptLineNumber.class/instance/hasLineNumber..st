testing
hasLineNumber: aScript
	^ aScript parameters at: 'lineNumber' ifPresent: [ :lN | lN = 'true' or: [ lN = true ] ] ifAbsent: [ false ]
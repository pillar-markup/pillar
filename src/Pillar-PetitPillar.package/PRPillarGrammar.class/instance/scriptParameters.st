grammar - Script
scriptParameters
	^ parametersUntilNewline , newline ==> [ :array | array first ]
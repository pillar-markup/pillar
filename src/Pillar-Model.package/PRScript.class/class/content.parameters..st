instance creation
content: aString parameters: parameters
	^ (self content: aString)
		parameters: parameters;
		yourself
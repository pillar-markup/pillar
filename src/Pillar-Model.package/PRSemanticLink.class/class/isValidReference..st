testing
isValidReference: aString

	| array |
	array := aString splitOn: ':'.
	^ array size > 1 & ((array at: 1) = self linkName)
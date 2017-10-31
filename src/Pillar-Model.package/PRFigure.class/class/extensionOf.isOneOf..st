testing
extensionOf: aString isOneOf: extensions
	| extension |
	extension := (aString splitOn: $.) last asLowercase.
	^ extensions includes: extension
testing
isValidReference: aString
	^ (self extensionOf: aString isOneOf: self pictureExtensions)
		and: [ aString includesSubstring: '://' caseSensitive: true ]
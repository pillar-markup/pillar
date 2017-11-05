grammar - Raw
raw
	^ super raw
		==>
			[ :array | 
			| type contentRaw |
			contentRaw := '' writeStream.
			contentRaw nextPutAll: array third.
			PRRaw content: contentRaw contents type: array second ]
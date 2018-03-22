visiting-document
visitMailLink: aMail

	canvas
		writeLinkDuring: [ self visitAll: aMail children ]
		destination: aMail unscrambledUrl.
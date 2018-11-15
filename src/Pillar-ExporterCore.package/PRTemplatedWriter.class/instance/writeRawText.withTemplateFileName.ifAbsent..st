writing
writeRawText: aText withTemplateFileName: templateFileName ifAbsent: aBlock

	^ self
		writeRawText: aText
		withTemplateFileName: templateFileName
		extraArguments: #()
		ifAbsent: aBlock
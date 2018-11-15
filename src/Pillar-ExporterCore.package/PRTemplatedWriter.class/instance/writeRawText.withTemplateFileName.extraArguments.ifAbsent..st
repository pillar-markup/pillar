writing
writeRawText: aText withTemplateFileName: templateFileName extraArguments: arguments ifAbsent: aBlock

	| templateFile result |
	templateFile := outputDocument templateDirectory / templateFileName.
	templateFile exists ifFalse: [ ^ aBlock value ].

	result := templateFile asMustacheTemplate value: ({ 'contents' -> aText value }, arguments) asDictionary.
	self visitRaw: (PRRaw content: result type: defaultWriter writerName)
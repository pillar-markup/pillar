visiting
visitExternalLink: aPRExternalLink

	| templateFile |
	templateFile := outputDocument templateDirectory / self externalLinkTemplateFileName.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRExternalLink.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents.
				'reference' -> aPRExternalLink reference } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName)]
		ifFalse: [ defaultWriter visitExternalLink: aPRExternalLink ].
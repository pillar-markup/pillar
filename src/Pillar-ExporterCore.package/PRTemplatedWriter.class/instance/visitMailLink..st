visiting
visitMailLink: aPRMailLink

	self
		write: aPRMailLink
		withTemplateFileName: self mailLinkTemplateFileName
		extraArguments: { 'reference' -> aPRMailLink reference }
		ifAbsent: [ defaultWriter visitExternalLink: aPRMailLink ]
visiting
visitExternalLink: aPRExternalLink

	self
		write: aPRExternalLink
		withTemplateFileName: self externalLinkTemplateFileName
		extraArguments: { 'reference' -> aPRExternalLink reference }
		ifAbsent: [ defaultWriter visitExternalLink: aPRExternalLink ]
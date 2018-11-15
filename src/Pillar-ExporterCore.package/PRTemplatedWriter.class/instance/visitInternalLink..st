visiting
visitInternalLink: aPRInternalLink

	self
		write: aPRInternalLink
		withTemplateFileName: self internalLinkTemplateFileName
		extraArguments: { 'reference' -> aPRInternalLink reference }
		ifAbsent: [ defaultWriter visitInternalLink: aPRInternalLink ]
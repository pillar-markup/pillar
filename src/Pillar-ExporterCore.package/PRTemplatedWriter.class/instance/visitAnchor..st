visiting
visitAnchor: aPRAnchor

	self
		writeRawText: ''
		withTemplateFileName: self anchorTemplateFileName
		extraArguments: { 'name' -> aPRAnchor name }
		ifAbsent: [ defaultWriter visitAnchor: aPRAnchor ]
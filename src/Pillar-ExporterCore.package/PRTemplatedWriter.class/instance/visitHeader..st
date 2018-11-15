visiting
visitHeader: aHeader

	self
		write: aHeader
		withTemplateFileName: self headerTemplateFileName
		extraArguments: { 'level' -> (aHeader level min: 7 max: 1) }
		ifAbsent: [ defaultWriter visitHeader: aHeader ]
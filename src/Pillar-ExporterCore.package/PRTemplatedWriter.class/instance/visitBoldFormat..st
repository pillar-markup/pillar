visiting
visitBoldFormat: aPRBoldFormat

	self
		write: aPRBoldFormat
		withTemplateFileName: self boldTemplateFileName
		ifAbsent: [ defaultWriter visitBoldFormat: aPRBoldFormat ]
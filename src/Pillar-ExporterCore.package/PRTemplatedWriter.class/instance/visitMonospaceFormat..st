visiting
visitMonospaceFormat: aPRMonospaceFormat 
	
	self
		write: aPRMonospaceFormat
		withTemplateFileName: self monospaceTemplateFileName
		ifAbsent: [ defaultWriter visitMonospaceFormat: aPRMonospaceFormat ]
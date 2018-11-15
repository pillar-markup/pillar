visiting
visitLineBreak: aPRLineBreak

	self
		writeRawText: ''
		withTemplateFileName: self lineBreakTemplateFileName
		ifAbsent: [ defaultWriter visitLineBreak: aPRLineBreak ]
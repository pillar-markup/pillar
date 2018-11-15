visiting
visitSection: aPRSection

	self
		write: aPRSection
		withTemplateFileName: self sectionTemplateFileName
		ifAbsent: [ defaultWriter visitSection: aPRSection ]
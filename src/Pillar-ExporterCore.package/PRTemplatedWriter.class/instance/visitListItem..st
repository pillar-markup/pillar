visiting
visitListItem: aPRListItem

	self
		write: aPRListItem
		withTemplateFileName: self listItemTemplateFileName
		ifAbsent: [ defaultWriter visitListItem: aPRListItem ]
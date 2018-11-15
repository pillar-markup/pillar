visiting
visitDataItem: aPRListItem

	self
		write: aPRListItem
		withTemplateFileName: self dataItemTemplateFileName
		ifAbsent: [ defaultWriter visitDataItem: aPRListItem ]
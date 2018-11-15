visiting
visitOrderedList: aPROrderedList

	self
		write: aPROrderedList
		withTemplateFileName: self orderedListTemplateFileName
		ifAbsent: [ defaultWriter visitOrderedList: aPROrderedList ]
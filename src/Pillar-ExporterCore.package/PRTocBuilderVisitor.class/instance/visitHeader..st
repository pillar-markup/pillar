visiting
visitHeader: aHeader
	| titleToc|
	titleToc := PRToc new name: aHeader text; level: aHeader level; fileRef: currentFile.
	self addToToc: titleToc
	
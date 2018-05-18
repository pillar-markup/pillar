visiting
visitHeader: aHeader
	| titleToc|
	titleToc := PRToc new name: aHeader text; level: aHeader level; fileReference: currentFile.
	self addToToc: titleToc
	
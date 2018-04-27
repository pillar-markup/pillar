visiting
visitHeader: aHeader
	| titleToc|
	titleToc := PRToc new name: aHeader text; level: aHeader level; fileRef: documentSource.
	self addToToc: titleToc
	
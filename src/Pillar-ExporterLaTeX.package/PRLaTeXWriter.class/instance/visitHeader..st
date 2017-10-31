visiting-document
visitHeader: aHeader
	| section |
	section := self getTypeOfSectionFor: aHeader.
	canvas command
		name: section;
		parameter: [ super visitHeader: aHeader ]
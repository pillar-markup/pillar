visiting-document
getTypeOfSectionFor: aHeader
	| sections level section |
	sections := self sectioningCommands.
	level := self getLevelFor: aHeader.
	section := sections at: (level min: sections size max: 1).
	^ section
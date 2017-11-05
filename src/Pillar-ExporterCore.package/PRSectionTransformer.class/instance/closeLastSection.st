private
closeLastSection
	| lastSection |
	lastSection := self currentSection.
	sections at: self currentSectionIndex put: nil.
	self aSectionIsOpen
		ifTrue: [ self currentSection add: lastSection ]
		ifFalse: [ newChildren add: lastSection ]
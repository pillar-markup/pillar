private
cleanSectionsUnderLevel: aNumber
	[ self currentSectionIndex >= aNumber ] whileTrue: [ self closeLastSection ]
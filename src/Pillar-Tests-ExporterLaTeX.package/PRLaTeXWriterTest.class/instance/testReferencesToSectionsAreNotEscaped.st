tests
testReferencesToSectionsAreNotEscaped
	|item|
	item := PRInternalLink reference: '@a_section_somewhere'.
	self assertWriting: item includesText: 'a_section_somewhere'
helper
createNewCitationWith: documentItem

	^ PRCitation ref: (documentItem parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
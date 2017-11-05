helper
createNewCitationWith: documentItem

	tmpCitation := PRCitation ref: (documentItem parameters at: 'ref' ifAbsent:[ PRCitation defaultRef ])
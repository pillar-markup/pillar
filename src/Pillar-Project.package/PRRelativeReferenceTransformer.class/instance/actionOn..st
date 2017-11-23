actions
actionOn: aPRDocument

	PRUpdateFileInclusionReference
		start: aPRDocument
		with: (self destinationDirectoryFor: aPRDocument) fullName.
	^ aPRDocument
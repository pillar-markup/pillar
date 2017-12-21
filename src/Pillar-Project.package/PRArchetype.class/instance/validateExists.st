validating
validateExists

	self directory exists ifFalse: [
		self error: 'Archetype ', name, ' does not exist'
	].
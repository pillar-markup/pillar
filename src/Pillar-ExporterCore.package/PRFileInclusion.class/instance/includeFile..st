protected
includeFile: file
	| transformedSubDocument |
	transformedSubDocument := PRUpdateFileInclusionReference
		start: (self compileFile: file)
		with: (self pathForFile: file parent fullName).
	self replace: transformedSubDocument children
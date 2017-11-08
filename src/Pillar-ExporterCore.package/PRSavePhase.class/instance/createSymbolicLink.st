actions
createSymbolicLink
	| linkName |
	
	true ifTrue: [ ^ self ].
	
	(self configuration outputFile isStream
		or: [ self configuration outputDirectory
				= self configuration baseDirectory ])
		ifTrue: [ ^ self ].
	linkName := (self configuration outputDirectory
		resolve: self configuration outputFile) parent fullName , '/root'.
	PRCreateSymLink new
		createSymbolic: linkName
		to: self configuration outputDirectory fullName
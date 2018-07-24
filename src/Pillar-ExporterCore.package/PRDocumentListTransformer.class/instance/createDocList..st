as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles |
	document := PRDocumentGroup new.
	filesDirectory := aPRDocListAnnotation path.
	(workingDirectory resolve: self filesDirectory) exists
		ifTrue: [ 
			files := (workingDirectory resolve: aPRDocListAnnotation path) files.
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.
			availableTemplates := self lookForAvailableTemplates: aPRDocListAnnotation templates.
			
			self availableTemplates ifNotEmpty: [ document := PRRaw new text: '' ].
			1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				currentFile := (sortedFiles at: index).
				self addAbstractOfFile: self currentFile toDocument: document ] 
		].
	^ document
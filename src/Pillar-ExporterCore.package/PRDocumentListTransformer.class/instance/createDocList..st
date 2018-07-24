as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles |
	document := PRDocumentGroup new.
	filesDirectory := aPRDocListAnnotation path.
	availableTemplates := self lookForAvailableTemplates: aPRDocListAnnotation templates.
	(workingDirectory resolve: aPRDocListAnnotation path) exists
		ifTrue: [ 
			files := (workingDirectory resolve: aPRDocListAnnotation path) files.
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.
			self availableTemplates ifNotEmpty: [ document := PRRaw new text: '' ].
			1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				currentFile := (sortedFiles at: index).
				self addAbstractOf: self currentFile to: document ] 
		].
	^ document
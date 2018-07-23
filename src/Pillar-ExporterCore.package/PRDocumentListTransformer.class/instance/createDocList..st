as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles |
	
	document := PRDocumentGroup new.
	self filesDirectory: aPRDocListAnnotation path.
	(workingDirectory resolve: aPRDocListAnnotation path) exists
		ifTrue: [ 
			files := (workingDirectory resolve: aPRDocListAnnotation path) files.
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.

			(self hasTemplateAt: (workingDirectory resolve: aPRDocListAnnotation path))
			ifTrue: [ document := PRRaw new text: '' ].
			1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				self currentFile: (sortedFiles at: index).
				self addAbstractOf: self currentFile to: document ]
			].
	^ document
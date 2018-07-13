as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles |
	
	(workingDirectory resolve: aPRDocListAnnotation path) exists
		ifTrue: [ files := self getPillarFilesFrom: aPRDocListAnnotation path.
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.

			document := (self hasTemplateAt: (workingDirectory resolve: aPRDocListAnnotation path))
			ifFalse: [  PRDocumentGroup new ] ifTrue: [ PRRaw new ].
		1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				self addAbstractOf: (sortedFiles at: index) to: document.
				
				"self addLink: (aPRDocListAnnotation path asFileReference / (sortedFiles at: index) basename) path pillarPrintString to: document" ]
			].
	^ document
as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles template |
	
	(workingDirectory resolve: aPRDocListAnnotation path) exists
		ifTrue: [ files := self getPillarFilesFrom: aPRDocListAnnotation path.
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.

			template := self lookForTemplate: (workingDirectory resolve: aPRDocListAnnotation path).
			template ifFalse: [  
				document := PRDocumentGroup new.
				1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				self addAbstractOf: (sortedFiles at: index) to: document.
				self addLink: (aPRDocListAnnotation path asFileReference / (sortedFiles at: index) basename) path pillarPrintString to: document ]
				
				]
			ifTrue: [ 
				document := PRRaw new.
				1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				document text: (self addAbstractOf: (sortedFiles at: index) to: document).

				"self addLink: (aPRDocListAnnotation path asFileReference / (sortedFiles at: index) basename) path pillarPrintString to: document" ] ] ].
	^ document
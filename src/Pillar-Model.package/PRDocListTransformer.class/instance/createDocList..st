as yet unclassified
createDocList: aPRDocListAnnotation

	| files document sortedFiles |

	document := PRDocumentGroup new.
	
	files := (workingDirectory resolve: aPRDocListAnnotation directory) children.
	
	sortedFiles := self sort: files by: aPRDocListAnnotation sort.
	
	1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index |
			self addAbstractOf: (sortedFiles at: index) to: document.
			self addLink: (sortedFiles at: index) to: document ].
	
	^ document
			
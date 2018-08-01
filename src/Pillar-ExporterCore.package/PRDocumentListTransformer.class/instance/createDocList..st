as yet unclassified
createDocList: aPRDocListAnnotation
	| files document sortedFiles |
	"Check if the specified path exist and get pillar files from it.
	Get some abstract of these pillar files. The final document is a DocumentGroup, but when templates
	are specified and exists It is a Raw HTML document"
	document := PRDocumentGroup new.
	
	availableTemplates := self lookForAvailableTemplates: aPRDocListAnnotation templates.
	self availableTemplates ifNotEmpty: [ document := PRRaw new text: '' ].
	
	filesDirectory := aPRDocListAnnotation path.
	(workingDirectory resolve: self filesDirectory) exists
		ifTrue: [ 
			files := (workingDirectory resolve: aPRDocListAnnotation path) files select: [ :each | each extension = 'pillar' ].
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.
			
			1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				currentFile := (sortedFiles at: index).
				
				"Parse current file and add an abstract to the general document"
				self addAbstractOfCurrentFileToDocument: document ] 
		].
	^ document
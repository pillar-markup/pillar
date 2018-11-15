tests-templatefiles
assertTemplate: template writesValue: value forNode: node

	| document result writer textDocument templateFileReference |
	
	textDocument := PRTextDocument new
			project: (PRProject new
				baseDirectory: FileSystem memory;
				yourself);
			yourself.
	writer := PRTemplatedWriter new
		outputDocument: textDocument;
		defaultWriter: PRTextWriter new;
		yourself.

	templateFileReference := textDocument templateDirectory / template.
	templateFileReference parent ensureCreateDirectory.
	templateFileReference writeStreamDo: [ :stream | stream nextPutAll: value ].

	document := PRDocument new
		add: node;
		yourself.

	result := writer write: document.
		
	self assert: result equals: value
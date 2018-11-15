tests
testWriteItalicUsesItalicTemplate

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

	templateFileReference := textDocument templateDirectory / PRTemplatedWriter italicTemplateFileName.
	templateFileReference parent ensureCreateDirectory.
	templateFileReference writeStreamDo: [ :stream | stream nextPutAll: 'italicTemplate' ].

	document := PRDocument new
		add: (PRItalicFormat with: (PRText content: 'Bar'));
		yourself.

	result := writer write: document.
		
	self assert: result equals: 'italicTemplate'
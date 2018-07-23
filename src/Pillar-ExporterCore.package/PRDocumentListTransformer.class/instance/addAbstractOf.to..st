adding
addAbstractOf: aFileReference to: aDocument
	^ self availableTemplates
	ifNotEmpty: [ 
		| previousContent |
		previousContent := aDocument text.
		aDocument text: previousContent , self getFirstElements ] 
	ifEmpty: [ 
		self getFirstElements do: [ :each | aDocument add: each ].
		aDocument add:
			((PRInternalLink reference: (self filesDirectory , '/' , self currentFile basename))
				addAll: {(PRText content: 'Read more')};
				yourself) ]
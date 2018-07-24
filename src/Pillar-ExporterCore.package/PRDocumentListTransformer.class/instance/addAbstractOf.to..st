adding
addAbstractOf: aFileReference to: aDocument
	^ self availableTemplates
		ifNotEmpty: [ 
			| previousContent |
			previousContent := aDocument text.
			aDocument text: previousContent , self getFirstElements ]
		ifEmpty: [ 
			aDocument addAll: self getFirstElements.
			aDocument
				add:
					((PRInternalLink reference: self filesDirectory , '/' , self currentFile basename)
						addAll: {(PRText content: 'Read more')};
						yourself) ]
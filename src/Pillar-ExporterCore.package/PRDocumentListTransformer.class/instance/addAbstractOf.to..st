adding
addAbstractOf: aFileReference to: aDocument
	^ (self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [ 
		| previousContent |
		previousContent := aDocument text.
		aDocument text: previousContent , self getFirstElements ] 
	ifFalse: [ 
		self getFirstElements do: [ :each | aDocument add: each ].
		aDocument add:
			((PRInternalLink reference: (self directoryName , '/', self currentFile basename))
				addAll: {(PRText content: 'Read more')};
				yourself) ]
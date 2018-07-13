adding
addLink: aString to: aDocument
	
	(self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [  ]
	ifFalse: [ 
		aDocument
		add:
			((PRInternalLink reference: aString)
				addAll: {(PRText content: 'See more')};
				yourself)
		 ]
adding
addLink: aString to: aDocument
	aDocument
		add:
			((PRInternalLink reference: aString)
				addAll: {(PRText content: 'See more')};
				yourself)
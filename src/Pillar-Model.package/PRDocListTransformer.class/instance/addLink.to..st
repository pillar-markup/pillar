adding
addLink: aFileReference to: aDocument
	aDocument
		add:
			((PRInternalLink reference: aFileReference pathString)
				addAll: {(PRText content: 'See more')};
				yourself)
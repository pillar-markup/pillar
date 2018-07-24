adding
addLinkToDocument: aDocument
	aDocument
		add:
			((PRInternalLink reference: self filesDirectory , '/' , self currentFile basename)
				addAll: {(PRText content: 'Read more')};
				yourself)
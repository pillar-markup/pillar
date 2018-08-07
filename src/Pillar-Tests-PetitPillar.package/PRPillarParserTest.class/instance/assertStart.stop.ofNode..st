asserting
assertStart: aStartInteger stop: aStopIndex ofNode: aDocumentItem
	self
		assert: aDocumentItem start
		equals: aStartInteger.
	self
		assert: aDocumentItem stop
		equals: aStopIndex.
	
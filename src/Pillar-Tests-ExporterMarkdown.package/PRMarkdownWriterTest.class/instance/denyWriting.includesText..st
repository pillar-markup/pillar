asserting
denyWriting: aDocumentItem includesText: aString
	| result |
	result := self write: aDocumentItem.
	self deny: result includesSubstring: aString
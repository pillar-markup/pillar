helpers
write: aDocumentItem
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := self createWriterOn: stream.
			writer start: aDocumentItem ]
helpers
write: aDocumentItem

	^ String
		streamContents: [ :stream | 
			| writer |
			writer := self createWriterOn: stream.
			writer start: aDocumentItem ]
accessing
messageText
	^ String
		streamContents: [ :stream | 
			stream << super messageText.
			file ifNotNil: [ stream << ' (' << file basename << ')' ] ]
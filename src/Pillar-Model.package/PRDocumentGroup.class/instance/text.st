accessing-dynamic
text
	^ String streamContents: [ :stream |
		self children do: [ :each |
			stream nextPutAll: each text ] ]
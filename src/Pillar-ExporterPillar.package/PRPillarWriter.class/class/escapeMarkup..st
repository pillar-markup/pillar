private
escapeMarkup: markup
	^ String streamContents: [ :str | markup do: [ :each | str nextPut: $\; nextPut: each ] ]
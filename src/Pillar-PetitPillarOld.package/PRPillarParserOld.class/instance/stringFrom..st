helpers
stringFrom: characterArray
	^ String streamContents: [ :stream | characterArray do: [ :character | stream nextPut: character ] ]
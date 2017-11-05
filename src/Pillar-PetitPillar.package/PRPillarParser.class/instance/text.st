grammar - Text
text
	"A text is a PRText with a string that contains any character inside."

	^ super text
		==> [ :array | 
			| stream |
			stream := '' writeStream.
			array do: [ :letter | stream nextPut: letter ].
			PRText content: stream contents ]
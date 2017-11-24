execution
doExecute
	
	| parser stream |
	parser := PRDocument parser.
	"We have to read the entire contents into memory because the API of ZnCharacterReadStream and the pillar parser are not compatible"
	stream := (ZnCharacterReadStream on: self inputStream) contents asString readStream.
	[ ^ parser parse: stream ]
		on: PRError , STONReaderError
		do: [ :exception | exception class signal: exception messageText , ' Inside: ' , self inputStream asString ].	
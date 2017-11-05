helpers
getStringForAll: aCollection
	"Visit each element of aCollection and exports everything to a new stream. Answer the stream content."
	^ String streamContents: [ :newStream | | visitor |
		visitor := (self class on: newStream)
			configuration: self configuration;
			yourself.
		aCollection do: [ :object | visitor start: object ] ]
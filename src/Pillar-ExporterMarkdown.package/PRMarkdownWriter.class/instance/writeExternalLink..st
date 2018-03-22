writing
writeExternalLink: anExternalLink
	"http://spec.commonmark.org/0.28/#links"

	canvas
		writeLinkDuring: [ self visitDocumentGroup: anExternalLink ]
		destination: anExternalLink localFileOrExternalReference.
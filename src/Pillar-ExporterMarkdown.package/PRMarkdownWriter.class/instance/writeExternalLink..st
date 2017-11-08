private
writeExternalLink: anExternalLink
	"http://spec.commonmark.org/0.28/#links"

	canvas raw: '['.
		self visitDocumentGroup: anExternalLink.
	canvas raw: '](' , anExternalLink localFileOrExternalReference , ')'
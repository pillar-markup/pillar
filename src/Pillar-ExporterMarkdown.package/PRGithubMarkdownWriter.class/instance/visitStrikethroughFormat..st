visiting-document
visitStrikethroughFormat: aFormat
	"https://github.github.com/gfm/#strikethrough-extension-"

	canvas raw: '~'.
	self visitFormat: aFormat.
	canvas raw: '~'
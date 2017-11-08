visiting-document
visitStrikethroughFormat: aFormat
	"https://docs.gitlab.com/ee/user/markdown.html#emphasis"

	canvas raw: '~~'.
	self visitFormat: aFormat.
	canvas raw: '~~'
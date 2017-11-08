visiting-document
visitTableRow: aTableRow
	"https://docs.gitlab.com/ee/user/markdown.html#tables"

	canvas raw: '| '.
	self visitAll: aTableRow children separatedBy: [ canvas raw: ' | ' ].
	canvas raw: ' |'.
	"GFM doesn't recognize tables without headers, so we always use the first row as headers (alternatively the header row would have to be empty)"
	firstRow
		ifTrue: [ firstRow := false.
			self writeTableConfiguration: aTableRow ].
	stream newLine
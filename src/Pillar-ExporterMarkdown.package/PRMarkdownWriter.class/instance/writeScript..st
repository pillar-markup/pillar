visiting-document
writeScript: aScript
	"http://spec.commonmark.org/0.28/#fenced-code-blocks"

	"I am not using indented code blocks (http://spec.commonmark.org/0.28/#indented-code-blocks), because they have no info strings (http://spec.commonmark.org/0.28/#info-string)"

	| language |
	canvas raw: '```'.
	language := self languageForScript: aScript.
	language isSyntaxHighlightingPossible
		ifTrue: [ canvas raw: language originalName ].
	canvas newLine.
	canvas raw: aScript text.
	canvas newLine.
	canvas raw: '```'.
	canvas newLine
protected
scriptLayout: aScript
	| text lines |
	text := aScript text.
	lines := (text substrings: self configuration newLine)
		collect: [ :each | '    ' , each , self configuration newLine ].
	canvas raw: lines.
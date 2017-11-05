streaming
trimLastNewLine
	| newLine |
	newLine := self configuration newLine.
	(newLine isEmpty or: [ stream position < newLine size ])
		ifTrue: [ ^ self ].
	stream position: stream position - newLine size.
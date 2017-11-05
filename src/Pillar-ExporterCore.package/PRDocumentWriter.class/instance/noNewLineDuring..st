helpers
noNewLineDuring: aBlock
	| oldNewLine |
	oldNewLine := self configuration newLine.
	self configuration newLine: ''.
	aBlock ensure: [ self configuration newLine: oldNewLine ]
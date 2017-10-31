tests
testMarkupType
	| markupType |
	markupType := self instance markupType.
	self assert: markupType notNil.
	self assert: markupType isSymbol
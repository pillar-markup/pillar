tests
testRaw
	| item |
	item := PRRaw content: self rawText.
	self
		assertWriting: item
		includesText:
			self rawText
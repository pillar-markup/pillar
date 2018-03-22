tests
testMailLink
	| item |
	configuration propertyAt: #scrambledEmailAddresses put: false.
	item := self addText: 'Foo Bar' to: (PRMailLink reference: 'foo@bar.com').
	self
		assertWriting: item
		includesTexts:
			{self emailToFoo . 'Foo Bar'}
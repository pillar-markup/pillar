tests - Header
testHeaderWithFormatAndText
	super testHeaderWithFormatAndText.
	self
		assert: result
		equals:
			(PRHeader
				withAll:
					{PRBoldFormat with: (PRText content: 'Foo').
					PRText content: ' bar'}
				level: 1).
	self assertStart: 1 stop: 12.
	self assertStart: 2 stop: 8 ofNode: result children first.
	self assertStart: 4 stop: 6 ofNode: result children first children first.
	self assertStart: 9 stop: 12 ofNode: result children second.

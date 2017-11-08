asserting
deny: result includesSubstring: expected
	expected isEmpty ifTrue: [ ^ self ].
	self
		deny: (result includesSubstring: expected)
		description:
			('''{1}'' is in ''{2}'''
				format:
					{expected.
					result})
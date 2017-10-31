tests - Text
testPreformatedTextWithMultiLines
	self
		parse:
			'= Foo
= Bar'
		rule: #preformatedText
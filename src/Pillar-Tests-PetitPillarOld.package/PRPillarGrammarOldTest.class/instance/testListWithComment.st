tests - List
testListWithComment
	self
		parse:
			'#Foo
%Comment
#Bar'
		rule: #list
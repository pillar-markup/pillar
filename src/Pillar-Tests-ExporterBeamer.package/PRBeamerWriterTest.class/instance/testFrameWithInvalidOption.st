tests
testFrameWithInvalidOption
	| wiki |
	wiki := '${frame:title=Foo|option=bar}$'.
	self should: [ self parser parse: wiki ] raise: PRError
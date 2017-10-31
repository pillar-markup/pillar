tests
testIsStructure
	| ston nLine script |
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script isStructure
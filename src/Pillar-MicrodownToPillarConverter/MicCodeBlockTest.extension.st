Extension { #name : 'MicCodeBlockTest' }

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicCodeBlockTest >> testSingleCodeBlockTwoLinesAsPillar [
	| source root code textBody argument |
	textBody := 'my fancy code
is really cool'.
	argument := 'ArgumentGoesHere'.
	source := CodeblockMarkup, argument, String cr, textBody, String cr, CodeblockMarkup. 
	root := self parser parse: source.
	code := root children first asPillar.
	self
		assert: code text
		equals:
			'my fancy code
is really cool'.
	self assert: code language originalName equals: 'ArgumentGoesHere'
]

Extension { #name : #MicQuoteBlockTest }

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicQuoteBlockTest >> testQuoteBlockAsPilar [
	| source root pillarNode |
	source := '> text1
>    text2'.
	root := parser parse: source.
	self assert: root children size equals: 1.
	pillarNode := root children first asPillar.
	self assert: pillarNode class equals: PRPreformatted.
	self
		assert: pillarNode text
		equals:
			'text1
text2'
]

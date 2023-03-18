Extension { #name : #MicHorizontalLineBlockTest }

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicHorizontalLineBlockTest >> testHorizontalLineBlockAsPillar [
	| source root pillar |
	source := '***
	'.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRHorizontalRule
	
]

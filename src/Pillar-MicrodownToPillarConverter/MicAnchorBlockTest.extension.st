Extension { #name : 'MicAnchorBlockTest' }

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicAnchorBlockTest >> testAnchorBlockAsPillar [
	| source root pillar |
	source := '@anchor'.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRAnchor.
	self assert: root children first label equals: 'anchor'
]

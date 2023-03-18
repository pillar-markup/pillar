Extension { #name : #MicRawBlockTest }

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicRawBlockTest >> testRawAsBackslash [
	"backslash should not be expanded in raw"
	| source rawBlock pillar |
	source := 'bla {{ aRaw\Text }} bla'.
	rawBlock := (parser parse: source) children first children second.
	pillar := rawBlock asPillar.
	self assert: pillar class equals: PRRaw.
	self assert: pillar text equals: ' aRaw\Text '
]

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicRawBlockTest >> testRawAsPillar [
	| source rawBlock pillar |
	source := 'bla {{ aRawText }} bla'.
	rawBlock := (parser parse: source) children first children second.
	pillar := rawBlock asPillar.
	self assert: pillar class equals: PRRaw.
	self assert: pillar text equals: ' aRawText '
]

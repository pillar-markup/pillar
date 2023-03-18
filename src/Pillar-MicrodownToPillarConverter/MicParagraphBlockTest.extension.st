Extension { #name : #MicParagraphBlockTest }

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicParagraphBlockTest >> testSingleParagraphWithFormat [
	| source root pillar |
	source := 'This **paragraph** with spaces'.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRParagraph.
	self assert: pillar children first class equals: PRText.
	self assert: pillar children first text equals: 'This '.
	self assert: pillar children second class equals: PRBoldFormat.
	self assert: pillar children third class equals: PRText.
	self assert: pillar children third text equals: ' with spaces'.
	 
	
]

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicParagraphBlockTest >> testSingleParagraphWithIndentedTextAsPillar [
	| source root expected pillar |
	source := 'This is
   a paragraph with spaces
	and one with tabs'.
	expected := 'This is
a paragraph with spaces
and one with tabs'.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRParagraph.
	self assert: pillar children first class equals: PRText.
	self assert: pillar children first text equals: expected
]

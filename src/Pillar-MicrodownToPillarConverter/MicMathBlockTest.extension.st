Extension { #name : #MicMathBlockTest }

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicMathBlockTest >> testMathBlockAsPillar [
	| source root pillar |
	source := '
',MathOpeningBlockMarkup,'
V_i = C_0 - C_3
', MathClosingBlockMarkup.
root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRMathEnvironment.
	self assert: pillar children first class equals: PRText.
	
]

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicMathBlockTest >> testMathBlockAsPillarWithArgument [
	| source root pillar |
	source := '
',MathOpeningBlockMarkup,'toto=22&caption=isAlreadyDefined.
V_i = C_0 - C_3
', MathClosingBlockMarkup.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRMathEnvironment.
	self assert: pillar children first class equals: PRText.
	self assert: (pillar parameters at: 'toto') equals: '22'.
	self assert: pillar caption first text  equals: 'isAlreadyDefined.'.
	
]

{ #category : #'*Pillar-MicrodownToPillarConverter-Tests' }
MicMathBlockTest >> testMathBlockAsPillarWithArgumentWithFormatting [
	| source root pillar |
	source := '
',MathOpeningBlockMarkup,'toto=22&caption=**is**AlreadyDefined.
V_i = C_0 - C_3
', MathClosingBlockMarkup.
	root := parser parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRMathEnvironment.
	self assert: pillar children first class equals: PRText.
	self assert: (pillar parameters at: 'toto') equals: '22'.
	self assert: pillar caption first text equals: 'is'.
	self assert: pillar caption first class equals: PRBoldFormat.
	
]

Extension { #name : 'MicInlineParserTest' }

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testBasicTextAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc'.
	self assert: res first text equals: 'abc'.
	self assert: res first class equals: PRText.
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testBoldAndNestedItalicAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc**x_y_z**cba'.
	self assert: res second class equals: PRBoldFormat.
	self assert: res second children first text equals: 'x'.
	self assert: res second children second class equals: PRItalicFormat.
	self assert: res second children second children first text equals: 'y'.
	self assert: res second children third text equals: 'z'
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testBoldAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc**xyz**cba'.
	self assert: res second children first text equals: 'xyz'.
	self assert: res second class equals: PRBoldFormat.
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testExternalLinkAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc[alias](link)cba'.
	self assert: res second children first text equals: 'alias'.
	self assert: res second class equals: PRExternalLink.

]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testFigureAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc![alias](http://www.pharo.org)cba'.
	self assert: res second children first text equals: 'alias'.
	self assert: res second class equals: PRFigure

]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicInlineParserTest >> testItalicAsPillar [
	| res |
	res := MicInlineParser new pillarFrom: 'abc_xyz_cba'.
	self assert: res second children first text equals: 'xyz'.
	self assert: res second class equals: PRItalicFormat.
	
	
]

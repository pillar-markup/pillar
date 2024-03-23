Extension { #name : 'MicUnorderedListBlockTest' }

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicUnorderedListBlockTest >> testSingleLevelList2asPillar [
	| source root list item |
	source := '- item 1
  expanded
- item 2'.
	root := parser parse: source.
	list := root children first asPillar.
	self assert: list class equals: PRUnorderedList.
	self assert: list children size equals: 2.
	item := list children first.
	self assert: item class equals: PRListItem.
	self
		assert: item children first text
		equals:
			'item 1
expanded'
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicUnorderedListBlockTest >> testSingleLevelList2asPillarWithFormatting [
	| source root prlist item |
	source := '- **item 1** expanded
- item 2'.
	root := parser parse: source.
	prlist := root children first asPillar.
	self assert: prlist class equals: PRUnorderedList.
	self assert: prlist children size equals: 2.
	item := prlist children first.
	self assert: item class equals: PRListItem.
	self
		assert: item children first text
		equals:
			'item 1'.
			
	self
		assert: item children second text
		equals:
			' expanded'.
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicUnorderedListBlockTest >> testTwoLevelList1AsPillar [
	| source root list secondItem subItem |
	source := '- item 1
  - sublevel
- item 2'.
	root := parser parse: source.
	list := root children first asPillar.
	secondItem := list children second.
	self assert: secondItem class equals: PRListItem.
	self assert: secondItem children first class equals: PRText.
	self assert: secondItem children first text equals: 'item 2'.
	subItem := list children first children second.
	self assert: subItem class equals: PRUnorderedList.
	self
		assert: subItem children first text
		equals: 'sublevel'	"item 1"	"unorded list"	"sub item"
]

{ #category : '*Pillar-MicrodownToPillarConverter-Tests' }
MicUnorderedListBlockTest >> testTwoLevelList1AsPillarWithFormatting [
	| source root list secondItem subItem |
	source := '- item 1
  - `sublevel`
- item 2'.
	root := parser parse: source.
	list := root children first asPillar.
	secondItem := list children second.
	self assert: secondItem class equals: PRListItem.
	self assert: secondItem children first class equals: PRText.
	self assert: secondItem children first text equals: 'item 2'.
	subItem := list children first children second.
	self assert: subItem class equals: PRUnorderedList.
	self
		assert: subItem children first children first class
		equals: PRMonospaceFormat	"item 1"	"unorded list"	"sub item"
]

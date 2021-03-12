Class {
	#name : #PRTextWriterTableCellTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterTableCellTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterTableCellTest >> actualClass [
	^ PRTableCell
]

{ #category : #'tests-accessing' }
PRTextWriterTableCellTest >> testAlign [
	self instance align: #right.
	self assert: self instance align equals: #right
]

{ #category : #'tests-accessing' }
PRTextWriterTableCellTest >> testBeAlignedCenter [
	self instance beAlignedCenter.
	self assert: self instance align equals: #center.
	self assert: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
]

{ #category : #'tests-accessing' }
PRTextWriterTableCellTest >> testBeAlignedLeft [
	self instance beAlignedLeft.
	self assert: self instance align equals: #left.
	self deny: self instance isAlignedCenter.
	self assert: self instance isAlignedLeft.
	self deny: self instance isAlignedRight
]

{ #category : #'tests-accessing' }
PRTextWriterTableCellTest >> testBeAlignedRight [
	self instance beAlignedRight.
	self assert: self instance align equals: #right.
	self deny: self instance isAlignedCenter.
	self deny: self instance isAlignedLeft.
	self assert: self instance isAlignedRight
]

{ #category : #'tests-comparing' }
PRTextWriterTableCellTest >> testEqualAlign [
	self deny: self actualClass new beAlignedRight equals: self actualClass new beAlignedCenter.
	self deny: self actualClass new beAlignedCenter equals: self actualClass new beAlignedLeft
]

{ #category : #'tests-accessing' }
PRTextWriterTableCellTest >> testHeading [
	self deny: self instance heading.
	self deny: self instance isHeading.
	
	self instance heading: true.
	self assert: self instance heading.
	self assert: self instance isHeading.
	
	self instance heading: false.
	self deny: self instance heading.
	self deny: self instance isHeading
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseAlign1 [
	| wiki text tree |
	wiki := '|{left||center|}right'.
	text := 'left	center	right'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					beAlignedCenter;
					add: (PRText content: 'center');
					yourself);
				add: (PRTableCell new
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseAlign2 [
	| wiki text tree |
	wiki := '|}right|none|{left|none'.
	text := 'right	none	left	none'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				add: (PRTableCell new
					add: (PRText content: 'none');
					yourself);
				add: (PRTableCell new
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					add: (PRText content: 'none');
					yourself);
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseEncoding [
	| wiki text tree |
	wiki := '|*link*|+file://embedded.png+|foo{}'.
	text := 'link	file://embedded.png	foo{}'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRInternalLink new
						reference: 'link';
						yourself);
					yourself);
				add: (PRTableCell new
					add: (PRFigure new
						reference: 'file://embedded.png';
						yourself);
					yourself);
				add: (PRTableCell new
					add: (PRText content: 'foo{}');
					yourself);
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseHeading1 [
	| wiki text tree |
	wiki := '|!head|{!left||!center|}!right'.
	text := 'head	left	center	right'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beHeading;
					add: (PRText content: 'head');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedCenter;
					add: (PRText content: 'center');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseHeading2 [
	| wiki1 wiki2 text tree |
	wiki1 := '|!head|!{left|!|center|!}right'.
	wiki2 := '|!head|{!left||!center|}!right'.
	text := 'head	left	center	right'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beHeading;
					add: (PRText content: 'head');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedCenter;
					add: (PRText content: 'center');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki2.
	self textWriterAssertTree: tree equalsText: text
]

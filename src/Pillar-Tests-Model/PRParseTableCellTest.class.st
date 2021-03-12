Class {
	#name : #PRParseTableCellTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseTableCellTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseTableCellTest >> actualClass [
	^ PRTableCell
]

{ #category : #'tests-parsing' }
PRParseTableCellTest >> testParseAlign1 [
	| wiki tree |
	wiki := '|{left||center|}right'.
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
	
]

{ #category : #'tests-parsing' }
PRParseTableCellTest >> testParseAlign2 [
	| wiki tree |
	wiki := '|}right|none|{left|none'.
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
	
]

{ #category : #'tests-parsing' }
PRParseTableCellTest >> testParseEncoding [
	| wiki tree |
	wiki := '|*link*|+file://embedded.png+|foo{}'.
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
	
]

{ #category : #'tests-parsing' }
PRParseTableCellTest >> testParseHeading1 [
	| wiki tree |
	wiki := '|!head|{!left||!center|}!right'.
	
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

]

{ #category : #'tests-parsing' }
PRParseTableCellTest >> testParseHeading2 [
	| wiki1 tree |
	wiki1 := '|!head|!{left|!|center|!}right'.
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
	
]

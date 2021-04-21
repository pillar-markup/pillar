Class {
	#name : #PRTextWriterTableCellTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #testing }
PRTextWriterTableCellTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterTableCellTest >> actualClass [
	^ PRTableCell
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseAlign1 [
	| text tree |
	
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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseAlign2 [
	|  text tree |

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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseEncoding [
	| text tree |
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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseHeading1 [
	| text tree |
	
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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableCellTest >> testParseHeading2 [
	| text tree |

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

	self textWriterAssertTree: tree equalsText: text
]

Class {
	#name : #PRPillarWriterTableTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterTableTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterTableTest >> actualClass [
	^ PRTable
]

{ #category : #'tests-parsing' }
PRPillarWriterTableTest >> testParseBasic [
	| wiki tree |
	wiki := '|cell'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRText content: 'cell');
					yourself);
				yourself);
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterTableTest >> testParseSquare [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11|a12' , nLine , '|a21|a22'.
	tree := PRDocument new
		add:
				(PRTable new
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a11');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a12');
														yourself);
										yourself);
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a21');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a22');
														yourself);
										yourself);
						yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterTableTest >> testParseTriangle [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11' , nLine , '|a21|a22' , nLine , '|a31|a32|a33'.
	tree := PRDocument new
		add:
				(PRTable new
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a11');
														yourself);
										yourself);
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a21');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a22');
														yourself);
										yourself);
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a31');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a32');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a33');
														yourself);
										yourself);
						yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterTableTest >> testParseWithPreformattedAndLinkWithParameters [
	| wiki tree |
	wiki := '|==\+link\|a\+==|'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRMonospaceFormat new
						add: (PRText content: '+link|a+');
						yourself);
					yourself);
				add: (PRTableCell new
					yourself);
				yourself);
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
]

{ #category : #'tests-parsing' }
PRPillarWriterTableTest >> testParseWithPreformattedAndProtectedPipe [
	| wiki tree |
	wiki := '|==\|==|'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
				  
					add: (PRMonospaceFormat new
						add: (PRText content: '|');
						yourself);
			
					yourself);
				add: (PRTableCell new
					yourself);
				yourself);
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
]

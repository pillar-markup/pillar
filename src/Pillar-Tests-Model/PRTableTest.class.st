Class {
	#name : #PRTableTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTableTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTableTest >> actualClass [
	^ PRTable
]

{ #category : #'tests-accessing' }
PRTableTest >> testCount [
	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 1;
		assert: self instance columnCount equals: 1.

	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 2;
		assert: self instance columnCount equals: 2.

	self instance
		add:
			(PRTableRow new
				add: PRTableCell new;
				yourself).
	self
		assert: self instance rowCount equals: 3;
		assert: self instance columnCount equals: 2
]

{ #category : #'tests-parsing' }
PRTableTest >> testParseBasic [
	| wiki text tree |
	wiki := '|cell'.
	text := 'cell'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRText content: 'cell');
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTableTest >> testParseSquare [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11|a12' , nLine , '|a21|a22'.
	text := 'a11	a12' , nLine , 'a21	a22'.
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTableTest >> testParseTriangle [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11' , nLine , '|a21|a22' , nLine , '|a31|a32|a33'.
	text := 'a11' , nLine , 'a21	a22' , nLine , 'a31	a32	a33'.
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTableTest >> testParseWithPreformattedAndLinkWithParameters [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
]

{ #category : #'tests-parsing' }
PRTableTest >> testParseWithPreformattedAndProtectedPipe [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
]

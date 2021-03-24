Class {
	#name : #PRParseTableTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseTableTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseTableTest >> actualClass [
	^ PRTable
]

{ #category : #'tests-parsing' }
PRParseTableTest >> testParseBasic [
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseTableTest >> testParseSquare [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '|a11|a12' , nLine , '|a21|a22'.
	tree := PRDocument new
		        add: (PRTable new
				         add: (PRTableRow new
						          add: (PRTableCell new
								           add: (PRText content: 'a11');
								           yourself);
						          add: (PRTableCell new
								           add: (PRText content: 'a12');
								           yourself);
						          yourself);
				         add: (PRTableRow new
						          add: (PRTableCell new
								           add: (PRText content: 'a21');
								           yourself);
						          add: (PRTableCell new
								           add: (PRText content: 'a22');
								           yourself);
						          yourself);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseTableTest >> testParseTriangle [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '|a11' , nLine , '|a21|a22' , nLine , '|a31|a32|a33'.
	tree := PRDocument new
		        add: (PRTable new
				         add: (PRTableRow new
						          add: (PRTableCell new
								           add: (PRText content: 'a11');
								           yourself);
						          yourself);
				         add: (PRTableRow new
						          add: (PRTableCell new
								           add: (PRText content: 'a21');
								           yourself);
						          add: (PRTableCell new
								           add: (PRText content: 'a22');
								           yourself);
						          yourself);
				         add: (PRTableRow new
						          add: (PRTableCell new
								           add: (PRText content: 'a31');
								           yourself);
						          add: (PRTableCell new
								           add: (PRText content: 'a32');
								           yourself);
						          add: (PRTableCell new
								           add: (PRText content: 'a33');
								           yourself);
						          yourself);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseTableTest >> testParseWithPreformattedAndLinkWithParameters [
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
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseTableTest >> testParseWithPreformattedAndProtectedPipe [
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
	self parserAssertWiki: wiki equalsTree: tree.

]

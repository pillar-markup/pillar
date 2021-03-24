Class {
	#name : #PRTextWriterTableTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterTableTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterTableTest >> actualClass [
	^ PRTable
]

{ #category : #'tests-parsing' }
PRTextWriterTableTest >> testParseBasic [
	| text tree |

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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableTest >> testParseSquare [

	| text tree nLine |
	nLine := self lineEnding.
	text := 'a11	a12' , nLine , 'a21	a22'.
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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterTableTest >> testParseTriangle [

	| text tree nLine |
	nLine := self lineEnding.
	text := 'a11' , nLine , 'a21	a22' , nLine , 'a31	a32	a33'.
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

	self textWriterAssertTree: tree equalsText: text
]

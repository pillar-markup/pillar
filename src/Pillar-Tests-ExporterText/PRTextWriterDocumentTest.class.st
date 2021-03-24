Class {
	#name : #PRTextWriterDocumentTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-ExporterText'
}

{ #category : #testing }
PRTextWriterDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterDocumentTest >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRTextWriterDocumentTest >> testParseEmpty [
	| text tree |
	text := String new.
	tree := PRDocument new.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterDocumentTest >> testParseMultipleProperties [
	| text tree|

	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		propertyAt: 'authors' put: 'Someone else and me';
		yourself.

	self textWriterAssertTree: tree equalsText: text.

]

{ #category : #'tests-parsing' }
PRTextWriterDocumentTest >> testParseProperties [
	| text tree |
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	
	self textWriterAssertTree: tree equalsText: text.
	
]

{ #category : #'tests-parsing' }
PRTextWriterDocumentTest >> testParsePropertiesWithText [
	| text tree document |
	text := 'foobar'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		add:
				(PRParagraph new
						add: (PRText content: 'foobar');
						yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text.
	
]

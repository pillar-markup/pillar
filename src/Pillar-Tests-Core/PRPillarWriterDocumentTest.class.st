Class {
	#name : #PRPillarWriterDocumentTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #testing }
PRPillarWriterDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterDocumentTest >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRPillarWriterDocumentTest >> testParseEmpty [
	| wiki tree |
	wiki := String new.
	tree := PRDocument new.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterDocumentTest >> testParseMultipleProperties [
	| wiki tree |
	wiki := '{''title'':''The title'',''authors'':''Someone else and me''}'.
	
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		propertyAt: 'authors' put: 'Someone else and me';
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.


]

{ #category : #'tests-parsing' }
PRPillarWriterDocumentTest >> testParseProperties [
	| wiki  tree |
	wiki := '{''title'':''The title''}'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterDocumentTest >> testParsePropertiesWithText [

	| wiki tree |
	wiki := '{''title'':''The title''}' , self lineEnding , 'foobar'.
	tree := PRDocument new
		        propertyAt: 'title' put: 'The title';
		        add: (PRParagraph new
				         add: (PRText content: 'foobar');
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

Class {
	#name : #PRTextWriterDocumentItemTest3,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core-TextWriter'
}

{ #category : #private }
PRTextWriterDocumentItemTest3 >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRTextWriterDocumentItemTest3 >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRTextWriterDocumentItemTest3 >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRTextWriterDocumentItemTest3 >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRTextWriterDocumentItemTest3 >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRTextWriterDocumentItemTest3 >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRTextWriterDocumentItemTest3 >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRTextWriterDocumentItemTest3 >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRTextWriterDocumentItemTest3 >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

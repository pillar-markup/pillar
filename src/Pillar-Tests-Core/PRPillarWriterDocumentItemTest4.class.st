Class {
	#name : #PRPillarWriterDocumentItemTest4,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #private }
PRPillarWriterDocumentItemTest4 >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest4 >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRPillarWriterDocumentItemTest4 >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRPillarWriterDocumentItemTest4 >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRPillarWriterDocumentItemTest4 >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRPillarWriterDocumentItemTest4 >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest4 >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest4 >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest4 >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

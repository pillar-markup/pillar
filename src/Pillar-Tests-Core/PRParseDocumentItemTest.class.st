Class {
	#name : #PRParseDocumentItemTest,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRParseDocumentItemTest >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRParseDocumentItemTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRParseDocumentItemTest >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRParseDocumentItemTest >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRParseDocumentItemTest >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRParseDocumentItemTest >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRParseDocumentItemTest >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRParseDocumentItemTest >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRParseDocumentItemTest >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

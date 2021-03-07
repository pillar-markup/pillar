Class {
	#name : #PRParseDocumentItemTest2,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseDocumentItemTest2 class >> isAbstract [
	^ self = PRParseDocumentItemTest2
]

{ #category : #private }
PRParseDocumentItemTest2 >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRParseDocumentItemTest2 >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRParseDocumentItemTest2 >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRParseDocumentItemTest2 >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRParseDocumentItemTest2 >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRParseDocumentItemTest2 >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRParseDocumentItemTest2 >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRParseDocumentItemTest2 >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRParseDocumentItemTest2 >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

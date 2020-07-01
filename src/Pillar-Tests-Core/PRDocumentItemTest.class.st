"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #PRDocumentItemTest,
	#superclass : #PRObjectTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRDocumentItemTest >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRDocumentItemTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #utilities }
PRDocumentItemTest >> assertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

{ #category : #utilities }
PRDocumentItemTest >> assertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRDocumentItemTest >> assertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #private }
PRDocumentItemTest >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRDocumentItemTest >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRDocumentItemTest >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRDocumentItemTest >> parser [
	^ PRDocument parser
]

{ #category : #'tests-copying' }
PRDocumentItemTest >> testCopy [
	self assert: self instance equals: self instance copy.
	self assert: self instance hash equals: self instance copy hash.

	self deny: self instance identicalTo: self instance copy
]

{ #category : #'tests-comparing' }
PRDocumentItemTest >> testEqual [
	self assert: self instance equals: self instance.
	self assert: self instance equals: self actualInstance
]

{ #category : #'tests-comparing' }
PRDocumentItemTest >> testEqualNil [
	self deny: self instance isNil
]

{ #category : #'tests-comparing' }
PRDocumentItemTest >> testEqualOther [
	self deny: self instance equals: self fooInstance.
	self deny: self instance equals: self barInstance
]

{ #category : #'tests-testing' }
PRDocumentItemTest >> testHasChildren [
	self deny: self instance hasChildren
]

{ #category : #'tests-comparing' }
PRDocumentItemTest >> testHash [
	self assert: self instance hash equals: self instance copy hash
]

{ #category : #tests }
PRDocumentItemTest >> testIsHeader [
	self deny: self instance isHeader
]

{ #category : #tests }
PRDocumentItemTest >> testIsLink [
	self deny: self instance isLink
]

{ #category : #'tests-accessing' }
PRDocumentItemTest >> testText [
	self assert: self instance text isString
]

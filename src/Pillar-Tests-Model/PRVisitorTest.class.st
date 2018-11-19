Class {
	#name : #PRVisitorTest,
	#superclass : #PRBasicObjectTest,
	#category : 'Pillar-Tests-Model-Visitor'
}

{ #category : #testing }
PRVisitorTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self = PRVisitorTest
]

{ #category : #private }
PRVisitorTest >> actualClass [
	^ PRVisitor
]

{ #category : #helpers }
PRVisitorTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

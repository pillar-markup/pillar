Class {
	#name : #PRBasicMicroDownParserTest,
	#superclass : #TestCase,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #tests }
PRBasicMicroDownParserTest >> testHeader [ 

	| document |
	document := PRMicroDownParser parse: '# Header1
	
## Header 2
	
### Header 3'.
	self assert: document children first class equals: PRHeader.
	self assert: document children third class equals: PRHeader.
	self assert: document children fifth class equals: PRHeader
	
]

{ #category : #tests }
PRBasicMicroDownParserTest >> testNumberedList [ 

	| document |
	document := PRMicroDownParser parse: '1 item1
1 item2
'.
	self assert: document children first class equals: PROrderedList.

	self assert: document children first children first class equals: PRListItem
]

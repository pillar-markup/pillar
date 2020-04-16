Class {
	#name : #PRBasicMicroDownParserTest,
	#superclass : #TestCase,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #tests }
PRBasicMicroDownParserTest >> testCodeBlock [

	| document |
	document := PRMicroDownParser parse: '```language=pharo
	1-2 
```'.
	self assert: document children first class equals: PRCodeblock.
	
]

{ #category : #tests }
PRBasicMicroDownParserTest >> testCodeInText [

	| document |
	document := PRMicroDownParser parse: 'The method `foo` is fun'.
	self assert: document children first class equals: PRParagraph.
	self assert: document children first children second class equals: PRMonospaceFormat 
	
	
]

{ #category : #tests }
PRBasicMicroDownParserTest >> testHeader [ 

	| document |
	document := PRMicroDownParser parse: '# Header1
	
## Header 2
	
### Header 3'.
	"we could have use Grammar headerMarkup to build the text but this is clearer like that"
	self assert: document children first class equals: PRHeader.
	self assert: document children third class equals: PRHeader.
	self assert: document children fifth class equals: PRHeader
	
]

{ #category : #tests }
PRBasicMicroDownParserTest >> testNumberedList [ 

	| document |
	document := PRMicroDownParser parse: MicroDownSnippetFactory new orderedListWithTwoItemsSample.
	self assert: document children first class equals: PROrderedList.

	self assert: document children first children first class equals: PRListItem.
	self assert: document children first children second class equals: PRListItem
]

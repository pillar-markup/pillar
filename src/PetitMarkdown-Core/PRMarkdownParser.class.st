Class {
	#name : #PRMarkdownParser,
	#superclass : #PPMarkdownGrammar,
	#category : #'PetitMarkdown-Core'
}

{ #category : #'grammar-secondary' }
PRMarkdownParser >> angleBracketSource [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> atxHeading [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> autoLink [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> block [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> bullet [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> bulletList [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> code [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> emphasis [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> entity [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> enumerator [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> escapedCharacter [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> explicitImage [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> explicitLink [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> horizontalRule [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> inlines [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> label [
	^ self shouldBeImplemented
]

{ #category : #token }
PRMarkdownParser >> linebreak [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> linkDefinition [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> linkDefinitionTitle [
	^ super linkDefinitionTitle ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> listBlockLine [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> listContinuationBlock [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> listItem [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> listItemTight [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> listLoose [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> listTight [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> optionallyIndentedLine [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> orderedList [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> paragraph [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> referenceLink [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> setextHeading [
	^ self shouldBeImplemented
]

{ #category : #'grammar-block' }
PRMarkdownParser >> strong [
	^ self shouldBeImplemented
]

{ #category : #token }
PRMarkdownParser >> text [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> title [
	^ self shouldBeImplemented
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> underscoreOrStarLine [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> url [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PRMarkdownParser >> verbatim [
	^ self shouldBeImplemented
]

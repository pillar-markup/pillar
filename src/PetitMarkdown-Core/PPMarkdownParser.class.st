Class {
	#name : #PPMarkdownParser,
	#superclass : #PPMarkdownGrammar,
	#category : #'PetitMarkdown-Core'
}

{ #category : #parsing }
PPMarkdownParser class >> parse: aString [
	^ self new parse: aString
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> angleBracketSource [
	^ super angleBracketSource ==> [ :nodes| nodes second ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> atxHeading [
	^ super atxHeading ==> [ :nodes | |titleInlines last|
		titleInlines := self mergeInlines: nodes third.
		(nodes at: 5) ifNotEmpty: [ 
				last := titleInlines last.
				last text: last text trimBoth].
		PPMarkdownHeading new
			level: nodes first size;
			inlines: titleInlines;
			yourself]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> autoLink [
	^ super autoLink ==> [ :node| 
		PPMarkdownLink new 
			url: node;
			yourself]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> block [
	^ super block ==> [ :nodes | nodes second]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> bullet [
	^ super bullet ==> [ :nodes | nodes third ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> bulletList [
	^ super bulletList ==> [ :nodes |
		PPMarkdownUnorderedList new
			items: nodes second;
			yourself ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> code [
	^ super code ==> [ :nodes |
		PPMarkdownCode new
			text: nodes third;
			yourself ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> emphasis [
	^ super emphasis ==> [ :nodes |
		PPMarkdownEmphasis new
			inlines: (self mergeInlines: (nodes at: 5));
			yourself ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> entity [
	^ super entity ==> [ :nodes | PPMarkdownEntity with: nodes ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> enumerator [
	^ super enumerator ==> [ :nodes |  nodes second ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> escapedCharacter [
	^ super escapedCharacter ==> [ :nodes | nodes last asString ].
]

{ #category : #'grammar-block' }
PPMarkdownParser >> explicitImage [
	^ super explicitImage
		==> [ :nodes | PPMarkdownImage newFromLinkNode: nodes second ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> explicitLink [
	^ super explicitLink ==> [ :nodes | |urlAndLabel|
			urlAndLabel := nodes third.
			urlAndLabel isString
				ifTrue: [
					PPMarkdownLink new 
						text: nodes first;
						yourself]
				ifFalse: [
					PPMarkdownLink new 
						text: nodes first;
						url: urlAndLabel third;
						label: ((urlAndLabel at: 5) ifNil: [ '' ]);
						yourself ]]
]

{ #category : #grammar }
PPMarkdownParser >> horizontalRule [
	^ super horizontalRule ==> [ :nodes|
		PPMarkdownRule new]
]

{ #category : #grammar }
PPMarkdownParser >> inlines [
	^ super inlines ==> [ :nodes | self mergeInlines: nodes first].
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> label [
	^ super label ==> [ :nodes | 
		nodes second ].
]

{ #category : #token }
PPMarkdownParser >> linebreak [
	^ super linebreak ==> [:nodes| PPMarkdownLinebreak new]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> linkDefinition [
	^ super linkDefinition ==> [ :nodes |
		PPMarkdownLink new
			label: nodes first;
			url: (nodes at: 4);
			text: (nodes at: 6) ;
			yourself ]
]

{ #category : #grammar }
PPMarkdownParser >> linkDefinitionTitle [
	^ super linkDefinitionTitle ==> [ :nodes| nodes second ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> listBlockLine [
	^ super listBlockLine ==> [ :nodes |  nodes last ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> listContinuationBlock [
	^ super listContinuationBlock ==> [ :nodes | nodes second ]
]

{ #category : #grammar }
PPMarkdownParser >> listItem [
	^ super listItem ==> [ :nodes | |textNodes spaceText|
		
		spaceText := {nil. PPMarkdownText with: ' '}.
		
		textNodes := nodes second asOrderedCollection.
		nodes third do: [ :each| 
			textNodes add: spaceText; addAll: each ].
		
		 PPMarkdownListItem new
			label: nodes first parsedValue;
			addAll: (self mergeInlines: textNodes) ]

]

{ #category : #grammar }
PPMarkdownParser >> listItemTight [
	^ super listItemTight ==> [ :nodes | |textNodes spaceText|
		spaceText := {nil. PPMarkdownText with: ' '}.
		
		textNodes := nodes second asOrderedCollection.
		nodes third do: [ :each| 
			textNodes add: spaceText; addAll: each second].
		
		 PPMarkdownListItem new
			label: nodes first parsedValue;
			addAll: (self mergeInlines: textNodes) ]

]

{ #category : #grammar }
PPMarkdownParser >> listLoose [
	^ super listLoose ==> [ :nodes | nodes collect: #first ]
]

{ #category : #grammar }
PPMarkdownParser >> listTight [
	^ super listTight ==> [ :nodes | nodes first ]
]

{ #category : #convenience }
PPMarkdownParser >> mergeInlines: nodes [
	
	| elements inlineList break|
	space := PPMarkdownText with: ' '.
	
	elements := nodes collect: [:each| 
		(each first isNil and: [each second isArray not])
			ifTrue: [ each second ]
			ifFalse: [ 
				break := each first.
				(break isKindOf: PPMarkdownLinebreak)
					ifTrue: [break]
					ifFalse: [space]]].
	
	inlineList := OrderedCollection new.
	elements do: [:each|
		(inlineList isEmpty not and: [inlineList last isText and: [ each isText]])
			ifTrue: [ inlineList at: inlineList size put: inlineList last , each ]
			ifFalse: [ inlineList add: each]].
		
	^ inlineList
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> optionallyIndentedLine [
	^ super optionallyIndentedLine ==> [ :nodes |  nodes last ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> orderedList [
	^ super orderedList ==> [ :nodes |
		PPMarkdownOrderedList new
			items: nodes second;
			yourself ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> paragraph [
	^ super paragraph ==> [ :nodes |
		PPMarkdownParagraph new
			inlines: nodes second;
			yourself ]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> referenceLink [
	^ super referenceLink ==> [ :nodes | |reference|
		reference := nodes second.
		PPMarkdownLink new
			text: nodes first;
			label: (reference ifNil: [ nodes first ] ifNotNil: [ reference second ]);
			url: nil;
			yourself ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> setextHeading [
	^ super setextHeading ==> [ :nodes | |titleInlines last level|
		titleInlines := self mergeInlines: nodes first.
		level :=  nodes third parsedValue first = $=
			ifTrue: [ 1 ]
			ifFalse: [ 2 ].
		PPMarkdownHeading new
			level: level;
			inlines: titleInlines;
			yourself]
]

{ #category : #'grammar-block' }
PPMarkdownParser >> strong [
	^ super strong ==> [ :nodes |
		PPMarkdownStrong new
			inlines: (self mergeInlines: (nodes at: 5));
			yourself ]
]

{ #category : #token }
PPMarkdownParser >> text [
	^ super text ==> [ :nodes |
		PPMarkdownText with: nodes]
]

{ #category : #grammar }
PPMarkdownParser >> title [
	^ super title ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-secondary' }
PPMarkdownParser >> underscoreOrStarLine [
	^ super underscoreOrStarLine ==> [ :nodes | PPMarkdownRule new ]
]

{ #category : #grammar }
PPMarkdownParser >> url [
	^ super url ==> [ :nodes |
		PPMarkdownLink new
			label: nodes;
			url: nodes;
			yourself ]

]

{ #category : #grammar }
PPMarkdownParser >> verbatim [
	^ super verbatim ==> [ :nodes | |codeText|
		codeText := String streamContents: [ :s|
			nodes 
				do: [ :codeLine| s nextPutAll: codeLine second]	
				separatedBy: [ s cr]].
		PPMarkdownVerbatim new 
			text: codeText;
			yourself].
]

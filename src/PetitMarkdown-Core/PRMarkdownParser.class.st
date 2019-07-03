Class {
	#name : #PRMarkdownParser,
	#superclass : #PPMarkdownGrammar,
	#category : #'PetitMarkdown-Core'
}

{ #category : #'grammar-secondary' }
PRMarkdownParser >> atxHeading [
	^ (epsilonToken , super atxHeading , epsilonToken)
		==> [ :triple | 
			(PRHeader
				withAll: (self textize: triple second second)
				level: triple second first size)
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> code [
	^ (epsilonToken , super code , epsilonToken)
		==> [ :triple | 
			(PRMonospaceFormat withAll: (self textize: {triple second second}))
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> codeBlock [
	^ (epsilonToken , super codeBlock , epsilonToken)
		==> [ :triple | 
			| nodes paramNodes params |
			nodes := triple second.
			paramNodes := nodes second.
			params := OrderedDictionary new.
			paramNodes
				ifNotEmpty: [ params at: 'language' put: paramNodes first.
					2 to: paramNodes size do: [ :index | 
						| param eqPosition |
						param := paramNodes at: index.
						eqPosition := param indexOf: $=.
						eqPosition > 0
							ifTrue: [ params
									at: (param copyFrom: 1 to: eqPosition - 1)
									put: (param copyFrom: eqPosition + 1 to: param size) ]
							ifFalse: [ params at: param put: true ] ] ].
			(PRCodeblock content: nodes third parameters: params)
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #grammar }
PRMarkdownParser >> document [
	"I build a PRDocument. I get a collection with all the children of the PRDocument and I dd them one by one."

	^ super document ==> [ :array | PRDocument withAll: array ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> emphasis [
	^ (epsilonToken , super emphasis , epsilonToken)
		==> [ :triple | 
			(PRItalicFormat withAll: (self textize: triple second second))
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> inlines [
	^ super inlines ==> [ :array | self textize: array first ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> paragraph [
	^ super paragraph ==> [ :array | PRParagraph withAll: array second ]
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> setextHeading [
	^ (epsilonToken , super setextHeading , epsilonToken)
		==> [ :triple | 
			(PRHeader
				withAll: (self textize: triple second first)
				level:
				(triple second second first = $=
				ifTrue: [ 1 ]
				ifFalse: [ 2 ]))
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #'grammar-inline' }
PRMarkdownParser >> strong [
	^ (epsilonToken , super strong , epsilonToken)
		==> [ :triple | 
			(PRBoldFormat withAll: (self textize: triple second second))
				start: triple first start;
				stop: triple third stop;
				yourself ]
]

{ #category : #token }
PRMarkdownParser >> text [
	^ (epsilonToken , super text , epsilonToken)
		==> [ :array | 
			(PRText content: array second)
				start: array first start;
				stop: array third stop ]
]

{ #category : #private }
PRMarkdownParser >> textize: anArrayOfPRDocumentItemOrString [
	| contents string |
	contents := OrderedCollection new.
	string := ''.
	anArrayOfPRDocumentItemOrString
		do: [ :chunk | 
			chunk isString
				ifTrue: [ string := string , chunk ]
				ifFalse: [ string
						ifNotEmpty: [ contents add: (PRText content: string).
							string := '' ].
					contents add: chunk ] ].
	string
		ifNotEmpty: [ contents add: (PRText content: string).
			string := '' ].
	^ contents
]

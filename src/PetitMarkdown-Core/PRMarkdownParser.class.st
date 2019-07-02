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
PRMarkdownParser >> emphasis [
	^ (epsilonToken , super emphasis , epsilonToken)
		==> [ :triple | 
			(PRItalicFormat withAll: (self textize: triple second second))
				start: triple first start;
				stop: triple third stop;
				yourself ]
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
							string := '' ] ] ].
	string
		ifNotEmpty: [ contents add: (PRText content: string).
			string := '' ].
	^ contents
]

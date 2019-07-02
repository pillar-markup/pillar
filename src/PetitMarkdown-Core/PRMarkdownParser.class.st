Class {
	#name : #PRMarkdownParser,
	#superclass : #PPMarkdownGrammar,
	#category : #'PetitMarkdown-Core'
}

{ #category : #'grammar-secondary' }
PRMarkdownParser >> atxHeading [
	^ super atxHeading
		==> [ :triple | 
			| level nodes content string |
			level := triple second first size.
			content := OrderedCollection new.
			string := ''.
			nodes := triple second second.
			nodes
				do: [ :chunk | 
					chunk isString
						ifTrue: [ string := string , chunk ]
						ifFalse: [ string
								ifNotEmpty: [ content add: (PRText content: string).
									string := '' ] ] ].
			string
				ifNotEmpty: [ content add: (PRText content: string).
					string := '' ].
			(PRHeader withAll: content level: level)
				start: triple first start;
				stop: triple last stop;
				yourself ]
]

{ #category : #'grammar-secondary' }
PRMarkdownParser >> setextHeading [
	^ super setextHeading
		==> [ :triple | 
			| level nodes content string |
			level := triple second second first = $=
				ifTrue: [ 1 ]
				ifFalse: [ 2 ].
			content := OrderedCollection new.
			string := ''.
			nodes := triple second first.
			nodes
				do: [ :chunk | 
					chunk isString
						ifTrue: [ string := string , chunk ]
						ifFalse: [ string
								ifNotEmpty: [ content add: (PRText content: string).
									string := '' ] ] ].
			string
				ifNotEmpty: [ content add: (PRText content: string).
					string := '' ].
			(PRHeader withAll: content level: level)
				start: triple first start;
				stop: triple last stop;
				yourself ]
]

{ #category : #token }
PRMarkdownParser >> text [
	^ super text
		==> [ :array | 
			(PRText content: array second)
				start: array first start;
				stop: array third start - 1 ]
]

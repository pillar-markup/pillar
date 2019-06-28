"
A PPMarkdownNullBlock is a fake block in a PPMarkdownDocument, used as a placeholder at the insertion point for additional content (null pattern).
"
Class {
	#name : #PPMarkdownNullBlock,
	#superclass : #Object,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownNullBlock >> appendBlankLine: line in: parentNode [
	"do nothing"
]

{ #category : #'document building' }
PPMarkdownNullBlock >> appendIndentLine: line in: parentNode [ 
	parentNode
		replace: self
		with: (PPMarkdownVerbatim new text: line content)
]

{ #category : #'document building' }
PPMarkdownNullBlock >> appendQuoteLine: line in: parentNode [ 
	parentNode
		replace: self
		with: (PPMarkdownBlockQuote new text: line content)
]

{ #category : #'document building' }
PPMarkdownNullBlock >> appendTextLine: line in: parentNode [ 
	parentNode
		replace: self
		with: (PPMarkdownParagraph new inlines: line content)
]

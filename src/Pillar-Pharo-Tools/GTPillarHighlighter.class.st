"
This parser specializes the basic Pillar grammar for producing highlighting commands that are later used by the Rubric text editor.
"
Class {
	#name : #GTPillarHighlighter,
	#superclass : #PRPillarGrammar,
	#instVars : [
		'commands'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #accessing }
GTPillarHighlighter class >> ignoredNames [
	^ super ignoredNames, #(commands)
]

{ #category : #accessing }
GTPillarHighlighter >> annotatedParagraph [
	^ super annotatedParagraph token
	==> [ :t | 
		self commands add: (GTNoteHighlightingCommand new 
			start: t start;
			stop: t stop) ]
]

{ #category : #accessing }
GTPillarHighlighter >> commands [ 
	^ commands ifNil: [ commands := OrderedCollection new ]
]

{ #category : #accessing }
GTPillarHighlighter >> figure [
	^ super figure 
	==> [ :tokens | 
		self commands add: (
			GTPillarFileHighlightingCommand new 
				start: tokens first start;
				stop: tokens last stop;
				fileName: tokens third) ]
]

{ #category : #accessing }
GTPillarHighlighter >> figureMarkup [
	^ super figureMarkup token
]

{ #category : #accessing }
GTPillarHighlighter >> header [
	^ super header token
	==> [ :t | 
		self commands add: (GTHeadingHighlightingCommand new 
				start: t start;
				stop: t stop) ]
]

{ #category : #accessing }
GTPillarHighlighter >> monospaceFormat [
	^ super monospaceFormat token 
	==> [ :token | 
		self commands add: (GTMonospaceFormatHighlightingCommand new 
			start: token start;
			stop: token stop)]
]

{ #category : #accessing }
GTPillarHighlighter >> referenceFigure [
	^ super referenceFigure flatten
]

{ #category : #accessing }
GTPillarHighlighter >> script [
	"^ super script token"
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRCodeblock) asParser token , space star , lineEnd ==> [:t | t second ].
	^ (Markups at: PRCodeblock) asParser token , scriptParameters , endParser negate plus token , endParser
	==> [ :t | 
		self commands add: (GTPillarCodeHighlightingCommand new
			start: t third start;
			stop: t third stop; 
			properties: t second;
			string: t third inputValue) ]
]

{ #category : #accessing }
GTPillarHighlighter >> scriptParameters [
	^ super scriptParameters
	==> [ :array |
		(({ array first } asOrderedCollection addAll: array last; yourself)
			collect: [ :each |
				('' join: each first) -> (each second ifNotNil: [:second | '' join: second ]) ]) ]
]

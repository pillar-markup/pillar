"
| t |
t := Text new 
	append: '0123';
	addAttribute: (TextColor new color: Color red) from: 1 to: 4;
	append: 'more';
	addAttribute: (TextFontReference toFont: 
(LogicalFont familyName: 'Source Sans Pro' pointSize: 18)) from: 5 to: 8.

t asMorph openInWorld

"
Class {
	#name : #PRMorphWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'codeFont'
	],
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #example }
PRMorphWriter class >> example [
	"self new example"
	<sampleInstance>
	
	| writer |
	writer := PRMorphWriter new
		visit: self exampleDocument.
	writer text asMorph openInWindow.
	^ writer
]

{ #category : #example }
PRMorphWriter class >> exampleDocument [
	
	^ PRPillarParser new parse: self pillarInputExample
]

{ #category : #testing }
PRMorphWriter class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ false
]

{ #category : #example }
PRMorphWriter class >> pillarInputExample [
	^ '! Heading one 

!!Heading Twoo 

""this is bold"" 

This is not bold 

This is a list
- item 1 ""this is bold again my friend""
- item 2

This is an ordered collection
# one
# two 

The following code shows the definition of the method ==printOn:==

[[[  
Point class >> new
	self foo	
]]] 

[[[language=smalltalk 
1 + 2 
]]]

! Heading one 

'
]

{ #category : #accessing }
PRMorphWriter class >> writerName [

	^ 'Morph'
]

{ #category : #accessing }
PRMorphWriter >> canvasClass [
	^ PRMorphCanvas
]

{ #category : #accessing }
PRMorphWriter >> codeFont [
	^ codeFont 
]

{ #category : #accessing }
PRMorphWriter >> codeFont: aFont [
	codeFont := aFont
]

{ #category : #initialization }
PRMorphWriter >> codeFontName [
	^ 'Bitmap DejaVu Sans'
]

{ #category : #initialization }
PRMorphWriter >> defaultCodeFont [
	^ LogicalFont familyName: self codeFontName pointSize: 14
]

{ #category : #initialization }
PRMorphWriter >> headerFontName [
	^ 'Source Sans Pro'
]

{ #category : #initialization }
PRMorphWriter >> initialize [
	super initialize.
	codeFont := self defaultCodeFont 
]

{ #category : #accessing }
PRMorphWriter >> text [ 
	
	^ canvas text
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitBoldFormat: anObject [
	
	canvas append: anObject text asText allBold

	
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitCodeblock: aCodeBlock [ 
	
	| pillarText | 
	pillarText := aCodeBlock text asText.
	canvas newLine.
	canvas append: 
		(pillarText addAttribute: (TextFontReference toFont: codeFont) from: 1 to: pillarText size).
	canvas newLine.
	canvas newLine
	
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitDocument: anObject [
	| numerator |
	numerator := (PRNumeratingVisitor new configuration: self configuration).
	numerator visit: anObject.
	super visitDocument: anObject. 
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitEmptyParagraph: anObject [

	canvas append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitHeader: anObject [
	| level pillarText |
	self writeCounterForHeader: anObject.
	level := anObject level.
	pillarText := anObject text asText.
	canvas
		append:
			(pillarText
				addAttribute:
					(TextFontReference
						toFont:
							(LogicalFont
								familyName: self headerFontName
								pointSize: (5 - level max: 1) * 8))
				from: 1
				to: anObject text size)
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitList: aListOfItems [
	
	aListOfItems children do: [ :each | 
		canvas append: '- '.
		self visitListItem: each.
		canvas append: String crlf
		]

]

{ #category : #visiting }
PRMorphWriter >> visitOrderedElements: aPROrderedList startingAt: anInteger [ 
	
	aPROrderedList withIndexDo: [ :each :i | 
		canvas append: i asString, ' '.
		self visitListItem: each.
		canvas append: String crlf
		]
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitOrderedList: aList [
	
	self visitOrderedElements: aList children startingAt: 1.
	
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitParagraph: anObject [

	super visitParagraph: anObject.
	canvas append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitText: aText [

	canvas append: aText text
	
]

{ #category : #writing }
PRMorphWriter >> writeCounterForHeader: aHeader [
	| headerConf level textResult |
	level := aHeader level.
	headerConf := self configuration levelConfigurationFor: aHeader.
	(headerConf numbering and: [ aHeader counter isValidCounter and: [ headerConf size > 0 ] ])
		ifFalse: [ ^ self ].
	textResult := (headerConf printCounter: aHeader counter elements) asText.
	textResult addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Source Sans Pro' pointSize: ((5 - level) max: 1) * 8)) from: 1 to: textResult size.
	canvas append: textResult.
	self writeCounterDefinitionSeparator
]

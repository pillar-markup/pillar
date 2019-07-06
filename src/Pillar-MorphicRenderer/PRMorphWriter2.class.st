Class {
	#name : #PRMorphWriter2,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'codeFont'
	],
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #example }
PRMorphWriter2 class >> example [
	"self new example"
	<sampleInstance>
	
	| writer |
	writer := PRMorphWriter2 new
		visit: self exampleDocument.
	writer text asMorph openInWindow.
	^ writer
]

{ #category : #example }
PRMorphWriter2 class >> exampleDocument [
	
	^ PRPillarParser new parse: self pillarInputExample
]

{ #category : #testing }
PRMorphWriter2 class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ false
]

{ #category : #example }
PRMorphWriter2 class >> pillarInputExample [
	^ '! Heading one 

!!Heading Twoo 

""this is bold""

this is not not bold 

this is a list
- item 1 ""this is bold again my friend""
- item 2

[[[language=smalltalk 
1 + 2 
]]]

! Heading one 

'
]

{ #category : #accessing }
PRMorphWriter2 class >> writerName [

	^ 'Morph'
]

{ #category : #accessing }
PRMorphWriter2 >> canvasClass [
	^ PRMorphCanvas
]

{ #category : #accessing }
PRMorphWriter2 >> codeFont [
	^ codeFont 
]

{ #category : #accessing }
PRMorphWriter2 >> codeFont: aFont [
	codeFont := aFont
]

{ #category : #initialization }
PRMorphWriter2 >> defaultCodeFont [
	^ (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 14)
]

{ #category : #initialization }
PRMorphWriter2 >> initialize [
	super initialize.
	codeFont := self defaultCodeFont 
]

{ #category : #accessing }
PRMorphWriter2 >> text [ 
	
	^ canvas text
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitBoldFormat: anObject [
	
	canvas append: anObject text asText allBold

	
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitCodeblock: aCodeBlock [ 
	
	| pillarText | 
	pillarText := aCodeBlock text asText.
	canvas append: 
		(pillarText addAttribute: (TextFontReference toFont: codeFont) from: 1 to: pillarText size)
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitDocument: anObject [
	| numerator |
	numerator := (PRNumeratingVisitor new configuration: self configuration).
	numerator visit: anObject.
	super visitDocument: anObject. 
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitEmptyParagraph: anObject [

	canvas append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitHeader: anObject [
	
	| level pillarText |
	self writeCounterForHeader: anObject.
	
	level := anObject level.
	pillarText := anObject text asText.
	canvas append: 
		(pillarText addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Source Sans Pro' pointSize: ((5 - level) max: 1) * 8)) from: 1 to: anObject text size).
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitListItem: anObject [
	
	canvas append: Character tab.
	canvas append: '- '.
	self visitDocumentGroup: anObject.
	canvas append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitParagraph: anObject [

	super visitParagraph: anObject.
	canvas append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter2 >> visitText: aText [

	canvas append: aText text
	
]

{ #category : #writing }
PRMorphWriter2 >> writeCounterForHeader: aHeader [
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

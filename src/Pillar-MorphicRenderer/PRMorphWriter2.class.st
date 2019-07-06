Class {
	#name : #PRMorphWriter2,
	#superclass : #PRDocumentWriter,
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #'as yet unclassified' }
PRMorphWriter2 class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ false
]

{ #category : #accessing }
PRMorphWriter2 class >> writerName [

	^ 'Morph'
]

{ #category : #accessing }
PRMorphWriter2 >> canvasClass [
	^ PRMorphCanvas
]

{ #category : #initialization }
PRMorphWriter2 >> initialize [
	super initialize.
	"stream := self defaultStream."
	"text := Text new."
]

{ #category : #accessing }
PRMorphWriter2 >> text [ 
	
	^ canvas text
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitBoldFormat: anObject [
	
	canvas append: anObject text asText allBold.	

	
]

{ #category : #visiting }
PRMorphWriter2 >> visitDocument: anObject [
	| numerator |
	numerator := (PRNumeratingVisitor new configuration: self configuration).
	numerator visit: anObject.
	super visitDocument: anObject. 
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitDocumentItem: anObject [ 

	text append: anObject text
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitEmptyParagraph: anObject [

	canvas append: String crlf
]

{ #category : #visiting }
PRMorphWriter2 >> visitHeader: anObject [
	
	| level pillarText |
	self writeCounterForHeader: anObject.
	
	level := anObject level.
	pillarText := anObject text asText.
	canvas append: 
		(pillarText addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Source Sans Pro' pointSize: ((5 - level) max: 1) * 8)) from: 1 to: anObject text size).
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitListItem: anObject [
	
	canvas append: Character tab.
	canvas append: '- '.
	self visitDocumentGroup: anObject.
	canvas append: String crlf
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitParagraph: anObject [

	super visitParagraph: anObject.
	canvas append: String crlf.
]

{ #category : #'as yet unclassified' }
PRMorphWriter2 >> visitScript: aScript [ 
	
	| level pillarText | 
	pillarText := aScript text asText.
	canvas append: 
		(pillarText addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)) from: 1 to: pillarText size).
]

{ #category : #'as yet unclassified' }
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

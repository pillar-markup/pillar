Class {
	#name : #PRMorphWriter,
	#superclass : #PRVisitor,
	#instVars : [
		'text'
	],
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #'as yet unclassified' }
PRMorphWriter class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ false
]

{ #category : #initialization }
PRMorphWriter >> initialize [
	super initialize.
	text := Text new.
]

{ #category : #accessing }
PRMorphWriter >> text [ 
	
	^ text
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitBoldFormat: anObject [
	
	text append: anObject text asText allBold.	

	
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitDocument: anObject [

	super visitDocument: anObject. 
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitDocumentItem: anObject [ 

	text append: anObject text
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitHeader: anObject [
	
	| level pillarText | 
	level := anObject level.
	pillarText := anObject text asText.
	text append: 
		(pillarText addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Source Sans Pro' pointSize: ((5 - level) max: 1) * 8)) from: 1 to: anObject text size).
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitListItem: anObject [
	
	text append: Character tab.
	text append: '- '.
	self visitDocumentGroup: anObject.
	text append: String crlf
]

{ #category : #'visiting-document' }
PRMorphWriter >> visitParagraph: anObject [

	super visitParagraph: anObject.
	text append: String crlf.
]

{ #category : #visiting }
PRMorphWriter >> visitScript: aScript [ 
	
	| level pillarText | 
	pillarText := aScript text asText.
	text append: 
		(pillarText addAttribute: (TextFontReference toFont: 
				(LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)) from: 1 to: pillarText size).
]

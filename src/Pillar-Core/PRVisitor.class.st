"
I am an abstract visitor. I provide a default implementation of all visit messages that does not descend automatically into children of the visited graph. Subclasses should override all my messages in appropriate ways to visit the nodes they need.
"
Class {
	#name : #PRVisitor,
	#superclass : #PRBasicObject,
	#category : #'Pillar-Core-Visitor'
}

{ #category : #visiting }
PRVisitor >> start: anObject [
	self visit: anObject
]

{ #category : #visiting }
PRVisitor >> visit: anObject [
	^ anObject acceptDecorated: self
]

{ #category : #visiting }
PRVisitor >> visitAll: aCollection [
	^ aCollection collect: [ :each | self visit: each ]
]

{ #category : #visiting }
PRVisitor >> visitAll: aCollection separatedBy: aBlock [
	^ aCollection do: [ :each | self visit: each ] separatedBy: aBlock
]

{ #category : #visiting }
PRVisitor >> visitAnchor: anObject [
	^ self visitDocumentItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitAnnotatedParagraph: aDocument [
	^ self visitParagraph: aDocument
]

{ #category : #visiting }
PRVisitor >> visitAnnotation: anAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	^ self visitDocumentGroup: anAnnotation
]

{ #category : #visiting }
PRVisitor >> visitBeginEnvironmentAnnotation: aBeginEnvironmentAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitBeginEnvironmentAnnotation vs visitBeginEnvironment."
	^ self visitAnnotation: aBeginEnvironmentAnnotation
]

{ #category : #visiting }
PRVisitor >> visitBoldFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitCitation: aCitation [
	^ self visitDocumentItem: aCitation
]

{ #category : #visiting }
PRVisitor >> visitCitationAnnotation: aCitation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	^ self visitAnnotation: aCitation
]

{ #category : #visiting }
PRVisitor >> visitCodeblock: aCodeBlock [ 
	^ self visitText: aCodeBlock
]

{ #category : #visiting }
PRVisitor >> visitColumn: aColumn [
	^ self visitDocumentGroup: aColumn
]

{ #category : #visiting }
PRVisitor >> visitColumnAnnotation: aColumnAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnAnnotation vs visitColumn."
	^ self visitAnnotation: aColumnAnnotation
]

{ #category : #visiting }
PRVisitor >> visitColumns: aColumns [
	^ self visitDocumentGroup: aColumns
]

{ #category : #visiting }
PRVisitor >> visitColumnsAnnotation: aColumnsAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnsAnnotation vs visitColumns."
	^ self visitAnnotation: aColumnsAnnotation
]

{ #category : #visiting }
PRVisitor >> visitCommentedLine: aCommentedLine [

]

{ #category : #visiting }
PRVisitor >> visitDataItem: anObject [
	^ self visitListItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitDefinitionList: anObject [
	^ self visitList: anObject
]

{ #category : #visiting }
PRVisitor >> visitDocListAnnotation: aPRDocListAnnotation [ 
	^ self visitAnnotation: aPRDocListAnnotation
]

{ #category : #visiting }
PRVisitor >> visitDocument: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitDocumentGroup: anObject [
	^ self visitAll: anObject children
]

{ #category : #visiting }
PRVisitor >> visitDocumentItem: anObject [
]

{ #category : #visiting }
PRVisitor >> visitEmptyParagraph: anObject [
	<ignoreForCoverage "This method is ignored for coverage because visiting an empty paragraph is typically very much different from visiting a paragraph.">
	
	^ self visitParagraph: anObject
]

{ #category : #visiting }
PRVisitor >> visitEndColumnsAnnotation: aEndColumnsAnnotation [
	^ self visitAnnotation: aEndColumnsAnnotation
]

{ #category : #visiting }
PRVisitor >> visitEndEnvironmentAnnotation: aEndEnvironmentAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitBeginEnvironmentAnnotation vs visitBeginEnvironment."
	^ self visitAnnotation: aEndEnvironmentAnnotation
]

{ #category : #visiting }
PRVisitor >> visitEnvironment: anObject [
	"An environment object has been created based on the begin and end annotations.
	My subclasses may want to introduce a preAction and postAction triggering. By default just visit all children."
	
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitExternalLink: anObject [
	^ self visitLink: anObject
]

{ #category : #visiting }
PRVisitor >> visitFigure: anObject [
	^ self visitReference: anObject
]

{ #category : #visiting }
PRVisitor >> visitFootnote: aFootnote [
	^ self visitDocumentItem: aFootnote
]

{ #category : #visiting }
PRVisitor >> visitFootnoteAnnotation: aFootnoteAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	^ self visitAnnotation: aFootnoteAnnotation
]

{ #category : #visiting }
PRVisitor >> visitFormat: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitHeader: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitHorizontalRule: anObject [
	^ self visitDocumentItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitInputFileAnnotation: anInputFileAnnotation [
	^ self visitAnnotation: anInputFileAnnotation
]

{ #category : #visiting }
PRVisitor >> visitInternalLink: anObject [
	^ self visitLink: anObject
]

{ #category : #visiting }
PRVisitor >> visitItalicFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitLineBreak: anObject [
	<ignoreForCoverage "This method is ignored for coverage because visiting a line break is typically very much different from visiting a standard document item.">
	^ self visitDocumentItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitLink: anObject [
	^ self visitReference: anObject
]

{ #category : #visiting }
PRVisitor >> visitList: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitListItem: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitLoaderAnnotation: aLoaderAnnotation [ 
	^ self visitAnnotation: aLoaderAnnotation
]

{ #category : #visiting }
PRVisitor >> visitMailLink: anObject [
	^ self visitExternalLink: anObject
]

{ #category : #visiting }
PRVisitor >> visitMonospaceFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitOrderedList: anObject [
	^ self visitList: anObject
]

{ #category : #visiting }
PRVisitor >> visitParagraph: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitParameter: anObject [
	^ self visitDocumentGroup: anObject 
]

{ #category : #visiting }
PRVisitor >> visitParameterKey: anObject [
	^ self visitDocumentItem: anObject 
]

{ #category : #visiting }
PRVisitor >> visitParameterValue: anObject [
	^ self visitDocumentItem: anObject 
]

{ #category : #visiting }
PRVisitor >> visitParameters: anObject [
	^ self visitDocumentGroup: anObject 
]

{ #category : #visiting }
PRVisitor >> visitPreformatted: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitRaw: aRaw [
	^ self visitText: aRaw
]

{ #category : #visiting }
PRVisitor >> visitReference: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitRunAnnotation: aRunAnnotation [ 
	^ self visitAnnotation: aRunAnnotation
]

{ #category : #visiting }
PRVisitor >> visitScreenshotAnnotation: aScreenshotAnnotation [ 
	^ self visitAnnotation: aScreenshotAnnotation
]

{ #category : #visiting }
PRVisitor >> visitSection: aSection [
	^ self visitDocumentGroup: aSection
]

{ #category : #visiting }
PRVisitor >> visitShowClassAnnotation: aShowClassAnnotation [ 
	^ self visitAnnotation: aShowClassAnnotation
]

{ #category : #visiting }
PRVisitor >> visitShowMethodAnnotation: aShowMethodAnnotation [ 
	^ self visitAnnotation: aShowMethodAnnotation
]

{ #category : #visiting }
PRVisitor >> visitSlide: aSlide [
	^ self visitDocumentGroup: aSlide
]

{ #category : #visiting }
PRVisitor >> visitSlideTitleAnnotation: aSlideTitleAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitSlideTitleAnnotation vs visitSlide."
	^ self visitAnnotation: aSlideTitleAnnotation
]

{ #category : #visiting }
PRVisitor >> visitStrikethroughFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitSubscriptFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitSuperscriptFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitTOCAnnotation: aTOCAnnotation [
	^ self visitAnnotation: aTOCAnnotation
]

{ #category : #visiting }
PRVisitor >> visitTable: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitTableCell: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitTableRow: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #visiting }
PRVisitor >> visitTermItem: anObject [
	^ self visitListItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitText: anObject [
	^ self visitDocumentItem: anObject
]

{ #category : #visiting }
PRVisitor >> visitUndefinedAnnotation: aUndefinedAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	^ self visitAnnotation: aUndefinedAnnotation
]

{ #category : #visiting }
PRVisitor >> visitUnderlineFormat: anObject [
	^ self visitFormat: anObject
]

{ #category : #visiting }
PRVisitor >> visitUnorderedList: anObject [
	^ self visitList: anObject
]

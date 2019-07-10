"
I am an abstract visitor. I provide a default implementation of all visit messages that does not descend automatically into children of the visited graph. Subclasses should override all my messages in appropriate ways to visit the nodes they need.
"
Class {
	#name : #PRVisitor,
	#superclass : #PRBasicObject,
	#category : 'Pillar-Model-Visitor'
}

{ #category : #testing }
PRVisitor class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ true
]

{ #category : #visiting }
PRVisitor >> start: anObject [
	self visit: anObject
]

{ #category : #visiting }
PRVisitor >> visit: anObject [
	anObject acceptDecorated: self
]

{ #category : #visiting }
PRVisitor >> visitAll: aCollection [
	aCollection do: [ :each | self visit: each ]
]

{ #category : #visiting }
PRVisitor >> visitAll: aCollection separatedBy: aBlock [
	aCollection do: [ :each | self visit: each ] separatedBy: aBlock
]

{ #category : #'visiting-document' }
PRVisitor >> visitAnchor: anObject [
	self visitDocumentItem: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitAnnotatedParagraph: aDocument [
	self visitParagraph: aDocument
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitAnnotation: anAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	self visitDocumentGroup: anAnnotation
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitBeginEnvironmentAnnotation: aBeginEnvironmentAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitBeginEnvironmentAnnotation vs visitBeginEnvironment."
	self visitAnnotation: aBeginEnvironmentAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitBoldFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitCitation: aCitation [
	self visitDocumentItem: aCitation
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitCitationAnnotation: aCitation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	self visitAnnotation: aCitation
]

{ #category : #'visiting-document' }
PRVisitor >> visitCodeblock: aCodeBlock [ 
	self visitText: aCodeBlock
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitColumn: aColumn [
	self visitDocumentGroup: aColumn
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitColumnAnnotation: aColumnAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnAnnotation vs visitColumn."
	self visitAnnotation: aColumnAnnotation
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitColumns: aColumns [
	self visitDocumentGroup: aColumns
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitColumnsAnnotation: aColumnsAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnsAnnotation vs visitColumns."
	self visitAnnotation: aColumnsAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitCommentedLine: aCommentedLine [

]

{ #category : #'visiting-document' }
PRVisitor >> visitDataItem: anObject [
	self visitListItem: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitDefinitionList: anObject [
	self visitList: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitDocListAnnotation: aPRDocListAnnotation [ 
	self visitAnnotation: aPRDocListAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitDocument: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitDocumentGroup: anObject [
	self visitAll: anObject children
]

{ #category : #'visiting-document' }
PRVisitor >> visitDocumentItem: anObject [
]

{ #category : #'visiting-document' }
PRVisitor >> visitEmptyParagraph: anObject [
	<ignoreForCoverage "This method is ignored for coverage because visiting an empty paragraph is typically very much different from visiting a paragraph.">
	
	self visitParagraph: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitEndColumnsAnnotation: aEndColumnsAnnotation [
	self visitAnnotation: aEndColumnsAnnotation
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitEndEnvironmentAnnotation: aEndEnvironmentAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitBeginEnvironmentAnnotation vs visitBeginEnvironment."
	self visitAnnotation: aEndEnvironmentAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitEnvironment: anObject [

	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitExternalLink: anObject [
	self visitLink: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitFigure: anObject [
	self visitReference: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitFootnote: aFootnote [
	self visitDocumentItem: aFootnote
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitFootnoteAnnotation: aFootnoteAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	self visitAnnotation: aFootnoteAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitFormat: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitHeader: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitHorizontalRule: anObject [
	self visitDocumentItem: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitInputFileAnnotation: anInputFileAnnotation [
	self visitAnnotation: anInputFileAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitInternalLink: anObject [
	self visitLink: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitItalicFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitLineBreak: anObject [
	<ignoreForCoverage "This method is ignored for coverage because visiting a line break is typically very much different from visiting a standard document item.">
	self visitDocumentItem: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitLink: anObject [
	self visitReference: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitList: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitListItem: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitMailLink: anObject [
	self visitExternalLink: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitMonospaceFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitOrderedList: anObject [
	self visitList: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitParagraph: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-parameters' }
PRVisitor >> visitParameter: anObject [
	^ self visitDocumentGroup: anObject 
]

{ #category : #'visiting-parameters' }
PRVisitor >> visitParameterKey: anObject [
	^ self visitDocumentItem: anObject 
]

{ #category : #'visiting-parameters' }
PRVisitor >> visitParameterValue: anObject [
	^ self visitDocumentItem: anObject 
]

{ #category : #'visiting-parameters' }
PRVisitor >> visitParameters: anObject [
	^ self visitDocumentGroup: anObject 
]

{ #category : #'visiting-document' }
PRVisitor >> visitPreformatted: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitRaw: aRaw [
	self visitText: aRaw
]

{ #category : #'visiting-document' }
PRVisitor >> visitReference: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitSection: aSection [
	self visitDocumentGroup: aSection
]

{ #category : #'visiting-extensions' }
PRVisitor >> visitSlide: aSlide [
	self visitDocumentGroup: aSlide
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitSlideTitleAnnotation: aSlideTitleAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitSlideTitleAnnotation vs visitSlide."
	self visitAnnotation: aSlideTitleAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitStrikethroughFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitStructure: aStructure [
	self visitDocumentItem: aStructure
]

{ #category : #'visiting-document' }
PRVisitor >> visitSubscriptFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitSuperscriptFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitTOCAnnotation: aTOCAnnotation [
	self visitAnnotation: aTOCAnnotation
]

{ #category : #'visiting-extensions' }
PRVisitor >> visitTable: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-extensions' }
PRVisitor >> visitTableCell: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-extensions' }
PRVisitor >> visitTableRow: anObject [
	self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitTermItem: anObject [
	self visitListItem: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitText: anObject [
	self visitDocumentItem: anObject
]

{ #category : #'visiting-annotations' }
PRVisitor >> visitUndefinedAnnotation: aUndefinedAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	^ self visitAnnotation: aUndefinedAnnotation
]

{ #category : #'visiting-document' }
PRVisitor >> visitUnderlineFormat: anObject [
	self visitFormat: anObject
]

{ #category : #'visiting-document' }
PRVisitor >> visitUnorderedList: anObject [
	self visitList: anObject
]

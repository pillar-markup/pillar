Extension { #name : #PRVisitor }

{ #category : #'*Pillar-Model' }
PRVisitor >> visitCitation: aCitation [
	^ self visitDocumentItem: aCitation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitCitationAnnotation: aCitation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	^ self visitAnnotation: aCitation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitColumn: aColumn [
	^ self visitDocumentGroup: aColumn
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitColumnAnnotation: aColumnAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnAnnotation vs visitColumn."
	^ self visitAnnotation: aColumnAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitColumns: aColumns [
	^ self visitDocumentGroup: aColumns
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitColumnsAnnotation: aColumnsAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitColumnsAnnotation vs visitColumns."
	^ self visitAnnotation: aColumnsAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitDocListAnnotation: aPRDocListAnnotation [ 
	^ self visitAnnotation: aPRDocListAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitEndColumnsAnnotation: aEndColumnsAnnotation [
	^ self visitAnnotation: aEndColumnsAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitEndEnvironmentAnnotation: aEndEnvironmentAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitBeginEnvironmentAnnotation vs visitBeginEnvironment."
	^ self visitAnnotation: aEndEnvironmentAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitFootnote: aFootnote [
	^ self visitDocumentItem: aFootnote
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitFootnoteAnnotation: aFootnoteAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	^ self visitAnnotation: aFootnoteAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitInputFileAnnotation: anInputFileAnnotation [
	^ self visitAnnotation: anInputFileAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitSlide: aSlide [
	^ self visitDocumentGroup: aSlide
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitSlideTitleAnnotation: aSlideTitleAnnotation [
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitSlideTitleAnnotation vs visitSlide."
	^ self visitAnnotation: aSlideTitleAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitTOCAnnotation: aTOCAnnotation [
	^ self visitAnnotation: aTOCAnnotation
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitTable: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitTableCell: anObject [
	^ self visitDocumentGroup: anObject
]

{ #category : #'*Pillar-Model' }
PRVisitor >> visitTableRow: anObject [
	^ self visitDocumentGroup: anObject
]

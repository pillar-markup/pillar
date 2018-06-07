"
I write a document as a navigation menu for ePub
"
Class {
	#name : #PREPubNavigationMenuWriter,
	#superclass : #PREPubMenuWriter,
	#category : 'Pillar-ExporterEPub'
}

{ #category : #accessing }
PREPubNavigationMenuWriter class >> fileExtension [
	^'nav.xhtml'
]

{ #category : #accessing }
PREPubNavigationMenuWriter class >> writerName [
	^#navmenu
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	
	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitCodeblock: aCodeBlock [
	
	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitDefinitionList: aList [

	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitFigure: aFigure [
	
	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitHeader: aHeader [
	canvas tag
		name: 'li';
		with: [ canvas tag
				name: 'a';
				parameterAt: 'href' put: (self refFor: aHeader);
				with: [ self visitDocumentGroup: aHeader ] ]
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitList: aList [

	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitOrderedList: aList [

	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitParagraph: aParagraph [
	
	"Do nothing, I should only write headers and sections"
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitSection: aSection [
	canvas tag
		name: 'ol';
		with: [ super visitDocumentGroup: aSection ]
]

{ #category : #'visiting-document' }
PREPubNavigationMenuWriter >> visitUnorderedList: aList [

	"Do nothing, I should only write headers and sections"
]

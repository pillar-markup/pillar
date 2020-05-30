"
I'm a little pillar tree generator.

"
Class {
	#name : #PRDocumentSample,
	#superclass : #PRDocument,
	#category : #'Pillar-Tests-Model-Core'
}

{ #category : #'annotated paragraph' }
PRDocumentSample >> annotatedParagraph [
	"PRPillarParserMain parse: '@@note one more annotated!'"
	
	^ PRDocument new
		add: (PRAnnotatedParagraph new
					annotation: 'note';
					add: (PRText content: 'one more annotated!'); 
					 yourself);
		yourself
]

{ #category : #formats }
PRDocumentSample >> bold [
	^ self withFormat: PRBoldFormat
]

{ #category : #headers }
PRDocumentSample >> headerLevel1 [
	^ self headerWithLevel: 1
]

{ #category : #headers }
PRDocumentSample >> headerLevel2 [
	^ self headerWithLevel: 2
]

{ #category : #headers }
PRDocumentSample >> headerLevel3 [
	  ^ self headerWithLevel: 3
]

{ #category : #headers }
PRDocumentSample >> headerLevel4 [
	  ^ self headerWithLevel: 4
]

{ #category : #headers }
PRDocumentSample >> headerLevel5 [
	^ self headerWithLevel: 5
]

{ #category : #headers }
PRDocumentSample >> headerLevel6 [
	^ self headerWithLevel: 6 
]

{ #category : #headers }
PRDocumentSample >> headerWithLevel: aLevel [
	  ^ self withStructure: (PRHeader new level: aLevel; yourself)
]

{ #category : #formats }
PRDocumentSample >> italic [
	^ self withFormat: PRItalicFormat 
]

{ #category : #formats }
PRDocumentSample >> monospace [
	^ self withFormat: PRMonospaceFormat 
]

{ #category : #list }
PRDocumentSample >> nestedList [
	^ PRDocument new
		add: (PROrderedList new
			add: (PRListItem new 
				add: (PRText content: 'item n1'); yourself);
			add: (PRUnorderedList new
				add: (PRListItem new 
					add: (PRText content: 'item a'); yourself);
				add: (PRListItem new 
					add: (PRText content: 'item b'); yourself);
				yourself);
			add: (PRListItem new 
				add: (PRText content: 'item n2'); 
				yourself);
		yourself); 
	yourself.
]

{ #category : #list }
PRDocumentSample >> orderedList [
	^ PRDocument new
		add: (PROrderedList new
			add: (PRListItem new 
				add: (PRText content: 'item n1'); yourself);
			add: (PRListItem new 
				add: (PRText content: 'item n2'); yourself);
		yourself); yourself.
]

{ #category : #preformatted }
PRDocumentSample >> preformatted [
	^ PRDocument new
		add: (PRPreformatted new
					add: (PRText content: 'foo'); 
					add: (PRText content: 'bar') ;yourself);
		yourself
]

{ #category : #list }
PRDocumentSample >> simpleOrderedList [

	^ (PROrderedList
			withAll:
				{(PRListItem with: (PRText content: 'First')).
				(PRListItem with: (PRText content: 'Second'))})
]

{ #category : #list }
PRDocumentSample >> simpleUnorderedList [

	^ (PRUnorderedList
			withAll:
				{(PRListItem with: (PRText content: 'First')).
				(PRListItem with: (PRText content: 'Second'))})
]

{ #category : #formats }
PRDocumentSample >> superscript [
	^ self withFormat: PRSuperscriptFormat 
]

{ #category : #formats }
PRDocumentSample >> underline [
	^ self withFormat: PRUnderlineFormat 
]

{ #category : #list }
PRDocumentSample >> unorderedList [
	^ PRDocument new
		add: (PRUnorderedList new
			add: (PRListItem new 
				add: (PRText content: 'item a'); yourself);
			add: (PRListItem new 
				add: (PRText content: 'item b'); yourself);
		yourself); yourself.
]

{ #category : #helpers }
PRDocumentSample >> withFormat: aPRFormatClass [
	^ PRDocument new
        add:
            (PRParagraph new
                add: (aPRFormatClass with: (PRText content: 'Foo'));
                yourself);
        yourself.
			
]

{ #category : #helpers }
PRDocumentSample >> withStructure: aPRObject [
	^ PRDocument new
		add: (aPRObject add: (PRText content: 'foo'); yourself); 
		yourself
]

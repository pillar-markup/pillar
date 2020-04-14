Class {
	#name : #PRDocumentSample,
	#superclass : #PRDocument,
	#category : #'Pillar-Core-Model'
}

{ #category : #format }
PRDocumentSample >> bold [
	^ self withFormat: PRBoldFormat
]

{ #category : #header }
PRDocumentSample >> headerLevel1 [
	  ^ self headerWithLevel: 1
]

{ #category : #header }
PRDocumentSample >> headerLevel2 [
	  ^ self headerWithLevel: 2
]

{ #category : #header }
PRDocumentSample >> headerLevel3 [
	  ^ self headerWithLevel: 3
]

{ #category : #header }
PRDocumentSample >> headerLevel4 [
	  ^ self headerWithLevel: 4
]

{ #category : #header }
PRDocumentSample >> headerLevel5 [
	  ^ self headerWithLevel: 5
]

{ #category : #header }
PRDocumentSample >> headerLevel6 [
	  ^ self headerWithLevel: 6
]

{ #category : #header }
PRDocumentSample >> headerWithLevel: aLevel [
	  ^ self withStructure: (PRHeader new level: aLevel; yourself)
]

{ #category : #format }
PRDocumentSample >> italic [
	^ self withFormat: PRItalicFormat 
]

{ #category : #format }
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

{ #category : #format }
PRDocumentSample >> superscript [
	^ self withFormat: PRSuperscriptFormat 
]

{ #category : #format }
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

{ #category : #format }
PRDocumentSample >> withFormat: aPRFormatClass [
	^ PRDocument new
        add:
            (PRParagraph new
                add: (aPRFormatClass with: (PRText content: 'Foo'));
                yourself);
        yourself.
			
]

{ #category : #'as yet unclassified' }
PRDocumentSample >> withStructure: aPRObject [
	^ PRDocument new
		add: (aPRObject add: (PRText content: 'foo');
			yourself)
]

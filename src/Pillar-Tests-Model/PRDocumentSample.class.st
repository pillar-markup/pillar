Class {
	#name : #PRDocumentSample,
	#superclass : #PRDocument,
	#category : #'Pillar-Tests-Model-Core'
}

{ #category : #accessing }
PRDocumentSample >> bold [
	^ self withFormat: PRBoldFormat
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel1 [
	  ^ self headerWithLevel: 1
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel2 [
	  ^ self headerWithLevel: 2
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel3 [
	  ^ self headerWithLevel: 3
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel4 [
	  ^ self headerWithLevel: 4
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel5 [
	  ^ self headerWithLevel: 5
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerLevel6 [
	  ^ self headerWithLevel: 6
]

{ #category : #'grammar - Format' }
PRDocumentSample >> headerWithLevel: aLevel [
	  ^ self withStructure: (PRHeader new level: aLevel; yourself)
]

{ #category : #accessing }
PRDocumentSample >> italic [
	^ self withFormat: PRItalicFormat 
]

{ #category : #accessing }
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

{ #category : #'grammar - Format' }
PRDocumentSample >> simpleOrderedList [

	^ (PROrderedList
			withAll:
				{(PRListItem with: (PRText content: 'First')).
				(PRListItem with: (PRText content: 'Second'))})
]

{ #category : #'grammar - Format' }
PRDocumentSample >> simpleUnorderedList [

	^ (PRUnorderedList
			withAll:
				{(PRListItem with: (PRText content: 'First')).
				(PRListItem with: (PRText content: 'Second'))})
]

{ #category : #accessing }
PRDocumentSample >> superscript [
	^ self withFormat: PRSuperscriptFormat 
]

{ #category : #accessing }
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

{ #category : #'instance creation' }
PRDocumentSample >> withFormat: aPRFormatClass [
	^ PRDocument new
        add:
            (PRParagraph new
                add: (aPRFormatClass with: (PRText content: 'Foo'));
                yourself);
        yourself.
			
]

{ #category : #'instance creation' }
PRDocumentSample >> withStructure: aPRObject [
	^ PRDocument new
		add: (aPRObject add: (PRText content: 'foo');
			yourself)
]

Class {
	#name : #PRDocumentSample,
	#superclass : #PRDocument,
	#category : #'Pillar-Core-Model'
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

{ #category : #accessing }
PRDocumentSample >> superscript [
	^ self withFormat: PRSuperscriptFormat 
]

{ #category : #accessing }
PRDocumentSample >> underline [
	^ self withFormat: PRUnderlineFormat 
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

{ #category : #'as yet unclassified' }
PRDocumentSample >> withStructure: aPRObject [
	^ PRDocument new
		add: (aPRObject add: (PRText content: 'foo');
			yourself)
]

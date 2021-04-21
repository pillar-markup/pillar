Class {
	#name : #PRTextWriterInternalLinkTest,
	#superclass : #PRTextWriterLinkTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #testing }
PRTextWriterInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRTextWriterInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-parsing' }
PRTextWriterInternalLinkTest >> testParseAnchored [
	| text tree |

	text := self actualClass new
		reference: self referenceString;
		anchor: 'Anchor';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterInternalLinkTest >> testParseEverything [
	| text tree |
	
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

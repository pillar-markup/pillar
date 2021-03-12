Class {
	#name : #PRTextWriterExternalLinkTest,
	#superclass : #PRTextWriterLinkTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRTextWriterExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRTextWriterExternalLinkTest >> testLinkToAFigureIsExternalLink [
	| text tree |

	text := self actualClass new
		reference: 'file://foo.png';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

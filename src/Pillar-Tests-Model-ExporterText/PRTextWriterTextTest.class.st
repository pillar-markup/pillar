Class {
	#name : #PRTextWriterTextTest,
	#superclass : #PRTextWriterDocumentItemTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #testing }
PRTextWriterTextTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterTextTest >> actualClass [
	^ PRText
]

{ #category : #'tests-parsing' }
PRTextWriterTextTest >> testParseLatex [
	| text tree |
	text := '\begin{foo}[bar]$zork$\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

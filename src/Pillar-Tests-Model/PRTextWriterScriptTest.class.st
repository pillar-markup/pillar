Class {
	#name : #PRTextWriterScriptTest,
	#superclass : #PRTextWriterTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRTextWriterScriptTest >> actualClass [
	^ PRCodeblock
]

{ #category : #'tests-parsing' }
PRTextWriterScriptTest >> testParseEscape [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: 'foo|';
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterScriptTest >> testParseRealLanguage [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterScriptTest >> testParseSimple [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'foo'.
	tree := PRDocument new
		add: (PRCodeblock content: 'foo');
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterScriptTest >> testParseWithSimpleCaption [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.

	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				caption: 'foo';
				yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

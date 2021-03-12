Class {
	#name : #PRParseScriptTest,
	#superclass : #PRParseTextTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #private }
PRParseScriptTest >> actualClass [
	^ PRCodeblock
]

{ #category : #tests }
PRParseScriptTest >> testIsStructure [
	| ston nLine script |
	self flag: #toRemove.
	"we do not support structure?"
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script isStructure
]

{ #category : #'tests-parsing' }
PRParseScriptTest >> testParseEscape [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=foo\|' , nLine , 'foo' , nLine , ']]]'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: 'foo|';
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseScriptTest >> testParseRealLanguage [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=smalltalk' , nLine , 'foo' , nLine , ']]]'.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRParseScriptTest >> testParseSimple [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[' , nLine , 'foo' , nLine , ']]]'.
	tree := PRDocument new
		add: (PRCodeblock content: 'foo');
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseScriptTest >> testParseSimpleOn1Line [
	"This test does *not* specify a valid usage of script. This test is here to ensure that there is a sensible default when writing invalid Pillar text."

	| wiki tree |
	wiki := '[[[foo]]]'.
	tree := PRDocument new
		add: (self addText: '[[[foo]]]' to: PRParagraph new);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseScriptTest >> testParseWithSimpleCaption [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[caption=foo' , nLine , 'foo' , nLine , ']]]'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				caption: 'foo';
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #tests }
PRParseScriptTest >> testStructureName [
	| ston nLine script |
	self flag: #toRemove.
	"we do not support structure?"
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script structureName equals: 'Test'
]

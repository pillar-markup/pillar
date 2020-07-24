"
A PRRawTest is xxxxxxxxx.

"
Class {
	#name : #PRScriptTest,
	#superclass : #PRTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRScriptTest >> actualClass [
	^ PRCodeblock
]

{ #category : #tests }
PRScriptTest >> testEqualScript [
	self assert: (self actualClass content: 'foo')  ~= (self actualClass content: 'bar').
	self assert: (self actualClass content: 'foo') equals: (self actualClass content: 'foo')
]

{ #category : #tests }
PRScriptTest >> testEqualScriptWithLanguage [
	| param1 param2 |
	param1 := SmallDictionary new
		at: 'language' put: 'smalltalk';
		yourself.
	param2 := SmallDictionary new
		at: 'language' put: 'html';
		yourself.
	self
		assert: (self actualClass content: 'foo' parameters: param1) ~= (self actualClass content: 'foo' parameters: param2).
	self
		assert:
			(self actualClass content: 'foo' parameters: param1)
				equals: (self actualClass content: 'foo' parameters: param1)
]

{ #category : #'tests-comparing' }
PRScriptTest >> testHash [
	| a b |
	a := self actualClass content: 'foo'.
	b := self actualClass content: 'foo'.
	self assert: a hash equals: a copy hash.
	self assert: a hash equals: b hash
]

{ #category : #tests }
PRScriptTest >> testIsStructure [
	| ston nLine script |
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script isStructure
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseEscape [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=foo\|' , nLine , 'foo' , nLine , ']]]'.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: 'foo|';
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseLanguage [
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseRealLanguage [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseSimple [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[' , nLine , 'foo' , nLine , ']]]'.
	text := 'foo'.
	tree := PRDocument new
		add: (PRCodeblock content: 'foo');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseSimpleOn1Line [
	"This test does *not* specify a valid usage of script. This test is here to ensure that there is a sensible default when writing invalid Pillar text."

	| wiki tree |
	wiki := '[[[foo]]]'.
	tree := PRDocument new
		add: (self addText: '[[[foo]]]' to: PRParagraph new);
		yourself.
	self assertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRScriptTest >> testParseWithSimpleCaption [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[caption=foo' , nLine , 'foo' , nLine , ']]]'.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				caption: 'foo';
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #tests }
PRScriptTest >> testStructureName [
	| ston nLine script |
	nLine := Smalltalk os lineEnding.
	ston := '[[[structure=Test' , nLine , 'Foo' , nLine , ']]]'.
	script := (self parser parse: ston) children first.
	self assert: script structureName equals: 'Test'
]

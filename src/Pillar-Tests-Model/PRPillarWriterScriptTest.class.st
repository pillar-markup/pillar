Class {
	#name : #PRPillarWriterScriptTest,
	#superclass : #PRPillarWriterTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRPillarWriterScriptTest >> actualClass [
	^ PRCodeblock
]

{ #category : #'tests-parsing' }
PRPillarWriterScriptTest >> testParseEscape [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=foo\|' , nLine , 'foo' , nLine , ']]]'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: 'foo|';
				yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterScriptTest >> testParseRealLanguage [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=smalltalk' , nLine , 'foo' , nLine , ']]]'.

	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterScriptTest >> testParseSimple [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[' , nLine , 'foo' , nLine , ']]]'.

	tree := PRDocument new
		add: (PRCodeblock content: 'foo');
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterScriptTest >> testParseWithSimpleCaption [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[caption=foo' , nLine , 'foo' , nLine , ']]]'.

	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				caption: 'foo';
				yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

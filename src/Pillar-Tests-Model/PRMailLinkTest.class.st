Class {
	#name : #PRMailLinkTest,
	#superclass : #PRExternalLinkTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRMailLinkTest >> testParseBogus [
	| wiki text tree |
	wiki := '*ab12@x.com*'.
	text := 'ab12@x.com'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'ab12@x.com';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRMailLinkTest >> testTitle [
	super testTitle.
	self instance reference: self referenceString.
	self assert: self instance title equals: self referenceString
]

{ #category : #'tests-accessing' }
PRMailLinkTest >> testUrl [
	self instance reference: self referenceString.
	self assert: (self instance url beginsWith: 'mailto:').
	self assert: self instance url ~= ('mailto:' , self referenceString).
	self assert: self instance scrambledUrl ~= ('mailto:' , self referenceString).
	self assert: self instance unscrambledUrl equals: 'mailto:' , self referenceString
]

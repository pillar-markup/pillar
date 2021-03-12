Class {
	#name : #PRParseMailLinkTest,
	#superclass : #PRParseExternalLinkTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #private }
PRParseMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRParseMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRParseMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRParseMailLinkTest >> testParseBogus [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRParseMailLinkTest >> testTitle [
	super testTitle.
	self instance reference: self referenceString.
	self assert: self instance title equals: self referenceString
]

{ #category : #'tests-accessing' }
PRParseMailLinkTest >> testUrl [
	self instance reference: self referenceString.
	self assert: (self instance url beginsWith: 'mailto:').
	self assert: self instance url ~= ('mailto:' , self referenceString).
	self assert: self instance scrambledUrl ~= ('mailto:' , self referenceString).
	self assert: self instance unscrambledUrl equals: 'mailto:' , self referenceString
]

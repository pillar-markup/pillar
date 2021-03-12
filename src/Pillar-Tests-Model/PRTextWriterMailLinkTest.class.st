Class {
	#name : #PRTextWriterMailLinkTest,
	#superclass : #PRTextWriterExternalLinkTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #private }
PRTextWriterMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRTextWriterMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRTextWriterMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRTextWriterMailLinkTest >> testParseBogus [
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
PRTextWriterMailLinkTest >> testTitle [
	super testTitle.
	self instance reference: self referenceString.
	self assert: self instance title equals: self referenceString
]

{ #category : #'tests-accessing' }
PRTextWriterMailLinkTest >> testUrl [
	self instance reference: self referenceString.
	self assert: (self instance url beginsWith: 'mailto:').
	self assert: self instance url ~= ('mailto:' , self referenceString).
	self assert: self instance scrambledUrl ~= ('mailto:' , self referenceString).
	self assert: self instance unscrambledUrl equals: 'mailto:' , self referenceString
]

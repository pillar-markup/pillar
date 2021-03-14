Class {
	#name : #PRParseListTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #private }
PRParseListTest >> actualClass [
	^ PRList
]

{ #category : #private }
PRParseListTest >> listItemClass [
	^ PRListItem
]

{ #category : #private }
PRParseListTest >> listItemWithText: aString [
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
]

{ #category : #'tests-parsing' }
PRParseListTest >> testParseEmpty [
	| wiki tree |
	wiki := self wikiString.
	tree := PRDocument new
		add: (self actualClass new
			add: self listItemClass new;
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseListTest >> testParseFlat [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , self wikiString , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseListTest >> testParseMultiple [
	| wiki  tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , nLine , self wikiString , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						yourself);
		add: PREmptyParagraph new;
		add:
				(self actualClass new
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseListTest >> testParseWithTrailingSpaces [
	| wiki tree |
	wiki := self wikiString , ' 1st'.
	tree := PRDocument new
		add:
			(self actualClass new
				add: (self listItemWithText: '1st');
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #private }
PRParseListTest >> wikiString [
	self subclassResponsibility
]

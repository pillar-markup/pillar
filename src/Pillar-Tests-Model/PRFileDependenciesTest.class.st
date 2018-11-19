Class {
	#name : #PRFileDependenciesTest,
	#superclass : #PRVisitorTest,
	#category : 'Pillar-Tests-Model-Visitor'
}

{ #category : #private }
PRFileDependenciesTest >> actualClass [
	^ PRFileDependencies 
]

{ #category : #tests }
PRFileDependenciesTest >> testDocumentWithFigure [
	| item set |
	item := PRDocument new
		add:
			(PRFigure new
				reference: 'file://foo.png';
				yourself);
		yourself.
	set := Set new.
	self
		assert: (self actualInstance start: item)
		equals: set
]

{ #category : #tests }
PRFileDependenciesTest >> testDocumentWithFile [
	| item set |
	item := PRDocument new
		add:
			(PRInternalLink new
				reference: 'file://foo.pillar';
				yourself);
		yourself.
	set := Set with: 'foo.pillar'.
	self
		assert: (self actualInstance start: item)
		equals: set
]

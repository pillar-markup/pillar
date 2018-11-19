Class {
	#name : #PRAssociateAnchorToSlideNumberTest,
	#superclass : #PRVisitorTest,
	#category : 'Pillar-Tests-Model-Visitor'
}

{ #category : #private }
PRAssociateAnchorToSlideNumberTest >> actualClass [
	^ PRAssociateAnchorToSlideNumber
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> configurationClass [

	^ ConfigurationForPillar
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitDocumentWithFigure [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRFigure new
				reference: 'file://picture.png';
				parameterAt: 'label' put: 'foo';
				yourself);
		yourself.
	dictionary := Dictionary with: 'foo' -> 1.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitDocumentWithScript [
	| item dictionary config |
	item := PRDocument new
		add:
			((PRCodeblock content: '|test| test := test')
				label: 'foo';
				yourself);
		yourself.
	dictionary := Dictionary with: 'foo' -> 1.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitDocumentWithSlideWithLabel [
	| item dictionary config |
	item := PRDocument new
		add: (PRSlide new label: 'foo');
		yourself.
	dictionary := Dictionary with: 'foo' -> 2.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitWithSlideInTemplate [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		add:
			(PRSlide new
				add: (PRAnchor named: 'bar');
				yourself) yourself.
	dictionary := Dictionary with: 'Bar' -> 3 with: 'bar' -> 4.
	config := self configurationClass new
		renderStructureAsSlide: true;
		slideInTemplateForDeckJS: 2;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitWithSlideWithHeaderRendering [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		add:
			(PRSlide new
				add: (PRAnchor named: 'bar');
				yourself) yourself.
	dictionary := Dictionary with: 'Bar' -> 2 with: 'bar' -> 3.
	config := self configurationClass new
		renderStructureAsSlide: true;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitWithSlideWithoutHeaderRendering [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		add:
			(PRSlide new
				add: (PRAnchor named: 'bar');
				yourself) yourself.
	dictionary := Dictionary with: 'Bar' -> 1 with: 'bar' -> 2.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitWithoutSlideWithHeaderRendering [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		yourself.
	dictionary := Dictionary with: 'Bar' -> 2.
	config := self configurationClass new
		renderStructureAsSlide: true;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

{ #category : #tests }
PRAssociateAnchorToSlideNumberTest >> testVisitWithoutSlideWithoutHeaderRendering [
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		yourself.
	dictionary := Dictionary with: 'Bar' -> 1.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary
]

"
I am a class of trait used to test different exporter of slide. (e.g. Beamer exporter, DeckJS exporter etc...)
"
Trait {
	#name : #PRTSliderWriterTest,
	#category : 'Pillar-Tests-ExporterCore'
}

{ #category : #private }
PRTSliderWriterTest >> actualClass [
	^ self explicitRequirement
]

{ #category : #requirements }
PRTSliderWriterTest >> endSlideTag [
	^ self explicitRequirement
]

{ #category : #requirements }
PRTSliderWriterTest >> headerInSlide [
	"I return one string that define a header rendering in a slide."

	^ self explicitRequirement
]

{ #category : #requirements }
PRTSliderWriterTest >> representationOfAnchor [
	"I return a string which reprensent an anchor in the slider format."

	^ self explicitRequirement
]

{ #category : #requirements }
PRTSliderWriterTest >> slideRepresentation [
	^ self explicitRequirement
]

{ #category : #requirements }
PRTSliderWriterTest >> slideTitle [
	"I return a collection with an explicite rendering of a slide title."

	^ self explicitRequirement
]

{ #category : #tests }
PRTSliderWriterTest >> testExport1SimpleSlide [
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts: self slideRepresentation.
]

{ #category : #tests }
PRTSliderWriterTest >> testExport2SlidesCloseAllFrames [
	"self debug: #testExportSlideTitle"

	| item resultString index |
	item := PRDocument new
		add: (PRSlide titled: 'Slide 1');
		add: (PRSlide titled: 'Slide 2');
		yourself.
	resultString := self write: item.
	index := resultString findString: self endSlideTag startingAt: 0.
	self assert: index > 0.
	index := resultString findString: self endSlideTag startingAt: index + 1.
	self assert: index > 0
]

{ #category : #tests }
PRTSliderWriterTest >> testRenderStructureAsSlide [
	| item |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		add: (PRSlide titled: 'Slide');
		yourself.
	self configuration renderStructureAsSlide: true.
	self assertWriting: item includesTexts: {(self headerInSlide)}.
	self configuration renderStructureAsSlide: false.
	self deny: [ (self write: item) includesSubstring: self headerInSlide ]
]

{ #category : #tests }
PRTSliderWriterTest >> testTitleOfSlide [
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		yourself.
	self
		assertWriting: item
		includesTexts: self slideTitle.
]

{ #category : #tests }
PRTSliderWriterTest >> testslideWithLabel [
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add:
				((PRSlide titled: 'Slide title')
						label: 'Foo';
						yourself);
		yourself.
	self assertWriting: item includesTexts: {(self representationOfAnchor)}
]

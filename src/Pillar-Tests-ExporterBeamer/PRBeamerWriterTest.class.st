Class {
	#name : #PRBeamerWriterTest,
	#superclass : #PRLaTeXWriterTest,
	#traits : 'PRTSliderWriterTest',
	#classTraits : 'PRTSliderWriterTest classTrait',
	#category : 'Pillar-Tests-ExporterBeamer'
}

{ #category : #private }
PRBeamerWriterTest >> actualClass [
	^ PRBeamerWriter
]

{ #category : #requirements }
PRBeamerWriterTest >> endSlideTag [
	^ '\end{frame}'
]

{ #category : #requirements }
PRBeamerWriterTest >> figureBegin [
	self skip: 'Beamer does not use figure environments because we typically don''t need a caption or label to reference'.
	^ ''
]

{ #category : #requirements }
PRBeamerWriterTest >> headerInSlide [
	"I return one string that define a header rendering in a slide."

	^ '\huge{'
]

{ #category : #requirements }
PRBeamerWriterTest >> level1HeaderWithFoo [
	^ '\section{foo}'
]

{ #category : #accessing }
PRBeamerWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterBeamer')
]

{ #category : #requirements }
PRBeamerWriterTest >> representationOfAnchor [
	"I return a string which reprensent an anchor in the slider format."

	^ '\label{'
]

{ #category : #'requirement-InternalLinks' }
PRBeamerWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '\hyperlink{foo}'
]

{ #category : #requirements }
PRBeamerWriterTest >> slideRepresentation [
	^ {'\begin{frame}'.
	'\frametitle{Slide title}'.
	'Presentation text'.
	'\end{frame}'}
]

{ #category : #requirements }
PRBeamerWriterTest >> slideTitle [
	"I return a collection with an explicite rendering of a slide title."

	^ {'\frametitle{'.
	'}'}
]

{ #category : #tests }
PRBeamerWriterTest >> testFigureCaptionWithNonTextChildren [
	"Ignore as we don't generate caption/label for figures"
]

{ #category : #tests }
PRBeamerWriterTest >> testFigureLabelGenerateAnchor [
	"Ignore as we don't generate caption/label for figures"
]

{ #category : #tests }
PRBeamerWriterTest >> testFigureLabelNotEscaped [
	"Ignore as we don't generate caption/label for figures"
]

{ #category : #tests }
PRBeamerWriterTest >> testFiguresHaveACaption [
	"Ignore as we don't generate caption/label for figures"
]

{ #category : #tests }
PRBeamerWriterTest >> testFrameWithInvalidOption [
	| wiki |
	wiki := '${frame:title=Foo|option=bar}$'.
	self should: [ self parser parse: wiki ] raise: PRError
]

{ #category : #tests }
PRBeamerWriterTest >> testFrameWithOption [
	"For now the option are not activated."

	"
	| item |
	item := PRDocument new
		add: (PRSlideTitleAnnotation parameters: (PRParameterParser parse: 'title=Slide title|option=plain') yourself);
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts:
			{'\begin{frame}[plain]'.
			'\frametitle{Slide title}'.
			'Presentation text'.
			'\end{frame}'}"

	
]

{ #category : #tests }
PRBeamerWriterTest >> testFrameWithoutOption [
	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts:
			{'\begin{frame}[fragile]'.
			'\frametitle{Slide title}'.
			'Presentation text'.
			'\end{frame}'}
]

{ #category : #tests }
PRBeamerWriterTest >> testScriptDefaultLanguage [
	"Ignore as we don't generate a language attribute"
]

{ #category : #tests }
PRBeamerWriterTest >> testScriptLabelGenerateAnchor [
	"Ignore as we don't generate anchors"
]

{ #category : #tests }
PRBeamerWriterTest >> testScriptsHaveACaption [
	"Ignore as we don't generate captions"
]

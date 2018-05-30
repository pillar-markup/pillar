Class {
	#name : #PRXHTMLWriterTest,
	#superclass : #PRHTMLWriterTest,
	#category : 'Pillar-Tests-ExporterEPub'
}

{ #category : #private }
PRXHTMLWriterTest >> actualClass [
	^PRXHTMLWriter 
]

{ #category : #private }
PRXHTMLWriterTest >> figureAnchorForPierLogo [
	^ '<img src="picture.png" id="pierLogo" alt=""/>'
]

{ #category : #private }
PRXHTMLWriterTest >> figureBegin [
	^ '<img'
]

{ #category : #requirements }
PRXHTMLWriterTest >> level1HeaderWithFoo [
	^ '<div id="foo"><h1>foo</h1>'
]

{ #category : #private }
PRXHTMLWriterTest >> strikethroughFoo [
	^ '<span class="striked">foo</span>'
]

{ #category : #tests }
PRXHTMLWriterTest >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	| item result |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	result := self write: item.
	self assert: (result includesSubstring: self figureBegin)
]

{ #category : #private }
PRXHTMLWriterTest >> underlineFoo [
	^ '<span class="underline">foo</span>'
]

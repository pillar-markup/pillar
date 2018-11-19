Class {
	#name : #PREPubTocMenuWriterTest,
	#superclass : #PRHTMLWriterTest,
	#category : 'Pillar-Tests-ExporterEPub'
}

{ #category : #'as yet unclassified' }
PREPubTocMenuWriterTest >> actualClass [
	^PREPubTocMenuWriter 
]

{ #category : #'as yet unclassified' }
PREPubTocMenuWriterTest >> level1HeaderWithFoo [
	^'<navLabel><text>foo</text></navLabel>'
]

{ #category : #'as yet unclassified' }
PREPubTocMenuWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterEPub')
]

{ #category : #'as yet unclassified' }
PREPubTocMenuWriterTest >> testHeadersAreNumbered [
	self skip: 'Headers are not numbered in toc menu'
]

{ #category : #'as yet unclassified' }
PREPubTocMenuWriterTest >> testSubHeadersAreNumbered [
	self skip: 'Headers are not numbered in toc menu'
]

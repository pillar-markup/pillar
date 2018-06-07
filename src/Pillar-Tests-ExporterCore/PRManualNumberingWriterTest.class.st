Class {
	#name : #PRManualNumberingWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : 'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #testing }
PRManualNumberingWriterTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #PRManualNumberingWriterTest
]

{ #category : #requirements }
PRManualNumberingWriterTest >> counter11DefinitionString [
	^ '1.1. '
]

{ #category : #requirements }
PRManualNumberingWriterTest >> counter11ReferenceString [
	^ '1.1'
]

{ #category : #requirements }
PRManualNumberingWriterTest >> counter1DefinitionString [
	^ '1. '
]

{ #category : #requirements }
PRManualNumberingWriterTest >> counter1ReferenceString [
	^ '1'
]

{ #category : #requirements }
PRManualNumberingWriterTest >> counter2DefinitionString [
	^ '2. '
]

{ #category : #requirements }
PRManualNumberingWriterTest >> level1HeaderWith1Foo [
	^ self level1HeaderBegin , self counter1DefinitionString , self foo
]

{ #category : #requirements }
PRManualNumberingWriterTest >> level2HeaderWith11Foo [
	^ self level2HeaderBegin , self counter11DefinitionString , self foo
]

{ #category : #requirements }
PRManualNumberingWriterTest >> level2HeaderWith1Foo [
	^ self level2HeaderBegin , self counter1DefinitionString , self foo
]

{ #category : #requirements }
PRManualNumberingWriterTest >> level2HeaderWithFoo [
	^ self level2HeaderBegin , self foo
]

{ #category : #requirements }
PRManualNumberingWriterTest >> referenceToFigurePierLogo [
	^ '0.1'
]

{ #category : #tests }
PRManualNumberingWriterTest >> testHeadersAreNumbered [
	| item |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter:
								((PRCascadingCounter maxLevel: 5)
										incrementAt: 1;
										incrementAt: 1);
						yourself);
		yourself.
	
	self configuration printer level1: (PRLevelNumberPrinter new level: 1 ; headerSize: 1; yourself).
	
	self
		assertWriting: item
		includesTexts:
			{self counter1DefinitionString.
			self counter2DefinitionString}
]

{ #category : #tests }
PRManualNumberingWriterTest >> testReferenceToFigureAnchor [
	| item resultString indexOfReference referenceString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRParagraph new
						add:
								(PRFigure new
										reference: 'file://picture.png';
										parameterAt: 'label' put: 'fig:picture';
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						add: (PRText content: 'See Figure ');
						add:
								((PRInternalLink reference: 'fig:picture')
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						yourself).
	[resultString := self write: item] on: PRLinkWarning do: [:w | w resume ].
	indexOfReference := resultString
		indexOfSubCollection: 'See Figure '
		startingAt: 1
		ifAbsent: [ self fail: 'The string ''See Figure '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self counter11ReferenceString
]

{ #category : #tests }
PRManualNumberingWriterTest >> testReferenceToHeaderAnchor [
	| item resultString indexOfReference referenceString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add: (PRAnchor named: 'chap:foo');
		add:
				(PRParagraph new
						add: (PRText content: 'See Chapter ');
						add:
								((PRInternalLink reference: 'chap:foo')
										counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
										yourself);
						yourself);
		yourself.
	[resultString := self write: item] on: PRLinkWarning do: [:w | w resume ].
	indexOfReference := resultString
		indexOfSubCollection: 'See Chapter '
		startingAt: 1
		ifAbsent: [ self fail: 'The string ''See Chapter '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self counter1ReferenceString
]

{ #category : #tests }
PRManualNumberingWriterTest >> testSubHeadersAreNumbered [
	| item |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo');
						counter:
								((PRCascadingCounter maxLevel: 5)
										incrementAt: 1;
										incrementAt: 2);
						yourself);
		yourself.
	self configuration printer  level1: (PRLevelNumberPrinter new headerSize: 1; level: 1; yourself). 
	self
		assertWriting: item
		includesTexts:
			{self counter1DefinitionString.
			self counter11DefinitionString}
]

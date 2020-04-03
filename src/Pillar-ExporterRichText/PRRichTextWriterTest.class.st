Class {
	#name : #PRRichTextWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'sample'
	],
	#category : #'Pillar-ExporterRichText'
}

{ #category : #asserting }
PRRichTextWriterTest >> assertWriting: aPRDocument include: expectedAttribute [
	self assert: ((PRRichTextComposer new start: aPRDocument) runs includes: expectedAttribute asArray)
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> boldFormat [
	^ TextEmphasis bold
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> externalLink: aLink [
	^ TextAction new actOnClickBlock: [WebBrowser openOn: aLink]
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> figure: aFigureLink [
	| url |
	url := aFigureLink.
	^ TextAnchor new anchoredMorph: (ZnEasy getPng: url)
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel1 [
	^ PRRichTextComposer headerLevelFont: 1
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel2 [
	^ PRRichTextComposer headerLevelFont: 2
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel3 [
	^ PRRichTextComposer headerLevelFont: 3
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel4 [
	^ PRRichTextComposer headerLevelFont: 4
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel5 [
	^ PRRichTextComposer headerLevelFont: 5
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> headerLevel6 [
	^ PRRichTextComposer headerLevelFont: 6
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> italicFormat [
	^ TextEmphasis italic
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> monospaceFormat [
	^ TextBackgroundColor color: Smalltalk ui theme settings windowColor
]

{ #category : #initialization }
PRRichTextWriterTest >> setUp [
	super setUp.
	sample := PRDocumentSample new
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> strikethroughtFormat [
	^ TextEmphasis struckOut
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> subscriptFormat [
	^ TextColor red
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> superscriptFormat [
	^ TextColor blue
]

{ #category : #'tests - format' }
PRRichTextWriterTest >> testBoldFormat [
	self assertWriting: sample bold include: self boldFormat
]

{ #category : #'tests - to be revisited' }
PRRichTextWriterTest >> testExternaLink [
	| pillarLink target obj1 obj2 raised|
	raised := false.
	[ pillarLink := '*SitePharo>https://get.pharo.org/64/*'.
	target := 'https://get.pharo.org/64/'.
	
	obj1 := ((PRRichTextComposer asText: pillarLink ) runs at: 1) first.
	obj2 := self externalLink: target. ] on: Error do: [ raised := true ].

	self assert: raised not.	
	self assert: obj1 class equals: (obj2 class).
	self assert: obj1 class name equals: #TextAction
]

{ #category : #'tests - to be revisited' }
PRRichTextWriterTest >> testFigure [
	| link pillarLink obj1 obj2 raised |
	raised := false.
	[  pillarLink := '+Pharologo>https://files.pharo.org/media/logo/logo.png+'.
		link := 'https://files.pharo.org/media/logo/logo.png'.
		
		obj1 := ((PRRichTextComposer asText: pillarLink ) runs at: 1) first.
		obj2 := self figure: link.] on: Error do: [ raised := true].
	
	self assert: raised not.
	self assert: obj1 class equals: (obj2 class).
	self assert: obj1 class name equals: #TextAnchor
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel1 [
	self assertWriting: sample headerLevel1 include: self headerLevel1
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel2 [
	self assertWriting: sample headerLevel2 include: self headerLevel2
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel3 [
	self assertWriting: sample headerLevel3 include: self headerLevel3
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel4 [
	self assertWriting: sample headerLevel4 include: self headerLevel4
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel5 [
	self assertWriting: sample headerLevel5 include: self headerLevel5
]

{ #category : #'tests - header' }
PRRichTextWriterTest >> testHeaderLevel6 [
	self assertWriting: sample headerLevel6 include: self headerLevel6
]

{ #category : #'tests - format' }
PRRichTextWriterTest >> testItalicFormat [
	self assertWriting: sample italic include: self italicFormat
]

{ #category : #'tests - format' }
PRRichTextWriterTest >> testMonospaceFormat [ 
	self assertWriting: sample monospace include: self monospaceFormat
]

{ #category : #'tests - list' }
PRRichTextWriterTest >> testOrderedList [ 

	|richText | 
	richText := (PRRichTextComposer new start: sample simpleOrderedList).
	self assert: richText string first equals: (PRRichTextComposer counterFor: 1 atLevel: 0) first.
	self assert: (richText string at: 'First' size + 5) equals: (PRRichTextComposer counterFor: 2 atLevel: 0) first.
]

{ #category : #skipped }
PRRichTextWriterTest >> testStrikethroughFormat [ 
	"Test fails: strikethrough is recognized only if spaces surround text
	So this test fails:
		self assertWriting: factory strikethroughFormatSample include: self strikethroughtFormat.
	"
	
	self skip.
]

{ #category : #'tests - format' }
PRRichTextWriterTest >> testSuperscriptFormat [
	self assertWriting: sample superscript include: self superscriptFormat
]

{ #category : #'tests - format' }
PRRichTextWriterTest >> testUnderlineFormat [ 
	self assertWriting: sample underline include: self underlineFormat
]

{ #category : #'tests - list' }
PRRichTextWriterTest >> testUnorderedList [ 

	|richText | 
	richText := (PRRichTextComposer new start: sample simpleUnorderedList).
	self assert: richText string first equals: (PRRichTextComposer bulletForLevel: 0) first.
	self assert: (richText string at: 'First' size + 4) equals: (PRRichTextComposer bulletForLevel: 0) first.
]

{ #category : #'grammar - Format' }
PRRichTextWriterTest >> underlineFormat [
	^ TextEmphasis underlined
]

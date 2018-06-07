Class {
	#name : #PRSBALaTeXWriterTest,
	#superclass : #PRLaTeXWriterTest,
	#category : 'Pillar-Tests-ExporterLaTeX'
}

{ #category : #private }
PRSBALaTeXWriterTest >> actualClass [
	^ PRSBALaTeXWriter
]

{ #category : #requirements }
PRSBALaTeXWriterTest >> monospaceFoo [
	^ '\textcode{foo}'
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testFloatingScriptWithNoLanguageGeneratePlain [
	| script |
	script := (PRCodeblock content: 'foo')
		caption: 'a caption';
		yourself.
	self assertWriting: script includesText: '{plain}'
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testInFlowScriptWithCorrectNewLines [
	| item |
	item := PRCodeblock content: 'foo'.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testInFlowScriptWithNoLanguageGeneratePlain [
	| script |
	script := PRCodeblock content: 'foo'.
	self assertWriting: script includesTexts: #('\begin{displaycode}{plain}' 'foo')
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScript [
	"ignore as we have much more explicit tests in this class"
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScriptWithBothLabelAndCaption [
	| script |
	script := (PRCodeblock content: 'foo')
					label: 'myScript';
					caption: 'a caption';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, label=myScript]{html}{a caption}' 'foo')
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScriptWithCaptionAndNotLabel [
	| script |
	script := (PRCodeblock content: 'foo')
					caption: 'a caption';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float]{html}{a caption}' 'foo')
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScriptWithCaptionAndNotLabelAndShortCaption [
	| script |
	script := (PRCodeblock content: 'foo')
					caption: 'a caption';
					shortCaption: 'short';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, list text={short}]{html}{a caption}' 'foo')
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScriptWithLabelAndNotCaption [
	| script |
	script := (PRCodeblock content: 'foo')
					label: 'myScript';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, label=myScript]{html}{}' 'foo')
]

{ #category : #tests }
PRSBALaTeXWriterTest >> testScriptWithNeitherCaptionNorLabel [
	| script |
	script := (PRCodeblock content: 'foo')
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{displaycode}{html}' 'foo')
]

Class {
	#name : 'PRSBALaTeXWriterTest',
	#superclass : 'PRLaTeXWriterTest',
	#category : 'Pillar-Tests-ExporterLaTeX',
	#package : 'Pillar-Tests-ExporterLaTeX'
}

{ #category : 'private' }
PRSBALaTeXWriterTest >> actualClass [
	^ PRSBALaTeXWriter
]

{ #category : 'requirements' }
PRSBALaTeXWriterTest >> monospaceFoo [
	^ '\textcode{foo}'
]

{ #category : 'requirements' }
PRSBALaTeXWriterTest >> tableBegin [

	^ '\begin{fullwidthtabular}'
]

{ #category : 'requirements' }
PRSBALaTeXWriterTest >> tableEnd [

	^ '\end{fullwidthtabular}'
]

{ #category : 'tests' }
PRSBALaTeXWriterTest >> testFloatingScriptWithNoLanguageGeneratePlain [
	| script |
	script := (PRCodeblock content: 'foo')
		caption: 'a caption';
		yourself.
	self assertWriting: script includesText: '{plain}'
]

{ #category : 'tests' }
PRSBALaTeXWriterTest >> testInFlowScriptWithCorrectNewLines [
	| item |
	item := PRCodeblock content: 'foo'.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'
]

{ #category : 'tests' }
PRSBALaTeXWriterTest >> testInFlowScriptWithNoLanguageGeneratePlain [
	| script |
	script := PRCodeblock content: 'foo'.
	self assertWriting: script includesTexts: #('\begin{displaycode}{plain}' 'foo')
]

{ #category : 'tests' }
PRSBALaTeXWriterTest >> testScript [
	"ignore as we have much more explicit tests in this class"
]

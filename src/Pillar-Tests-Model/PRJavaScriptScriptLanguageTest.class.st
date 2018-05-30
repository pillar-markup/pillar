Class {
	#name : #PRJavaScriptScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRJavaScriptScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRJavaScriptScriptLanguageTest >> actualClass [
	^ PRJavaScriptScriptLanguage 
]

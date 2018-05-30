Class {
	#name : #PRHTMLScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRHTMLScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHTMLScriptLanguageTest >> actualClass [
	^ PRHTMLScriptLanguage 
]

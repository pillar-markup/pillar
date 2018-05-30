Class {
	#name : #PRSTONScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRSTONScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSTONScriptLanguageTest >> actualClass [
	^ PRSTONScriptLanguage 
]

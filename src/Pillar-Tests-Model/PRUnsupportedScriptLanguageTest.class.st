Class {
	#name : #PRUnsupportedScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRUnsupportedScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRUnsupportedScriptLanguageTest >> actualClass [
	^ PRUnsupportedScriptLanguage 
]

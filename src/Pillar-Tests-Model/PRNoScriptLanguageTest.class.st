Class {
	#name : #PRNoScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRNoScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRNoScriptLanguageTest >> actualClass [
	^ PRNoScriptLanguage
]

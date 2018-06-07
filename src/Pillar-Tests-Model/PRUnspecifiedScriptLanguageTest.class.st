Class {
	#name : #PRUnspecifiedScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRUnspecifiedScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRUnspecifiedScriptLanguageTest >> actualClass [
	^ PRUnspecifiedScriptLanguage
]

Class {
	#name : #PRJSONScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRJSONScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRJSONScriptLanguageTest >> actualClass [
	^ PRJSONScriptLanguage 
]

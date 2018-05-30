Class {
	#name : #PRHTTPScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRHTTPScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHTTPScriptLanguageTest >> actualClass [
	^ PRHTTPScriptLanguage 
]

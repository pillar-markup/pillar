Class {
	#name : #PRSQLScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRSQLScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSQLScriptLanguageTest >> actualClass [
	^ PRSQLScriptLanguage 
]

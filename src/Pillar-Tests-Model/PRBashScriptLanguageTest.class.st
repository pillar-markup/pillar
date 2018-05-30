Class {
	#name : #PRBashScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRBashScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRBashScriptLanguageTest >> actualClass [
	^ PRBashScriptLanguage 
]

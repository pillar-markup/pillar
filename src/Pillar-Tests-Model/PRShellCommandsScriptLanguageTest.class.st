Class {
	#name : #PRShellCommandsScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRShellCommandsScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRShellCommandsScriptLanguageTest >> actualClass [
	^ PRShellCommandsScriptLanguage 
]

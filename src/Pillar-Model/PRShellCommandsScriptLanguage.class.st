"
A PRBashScriptLanguage is xxxxxxxxx.

"
Class {
	#name : #PRShellCommandsScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRShellCommandsScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #requirement }
PRShellCommandsScriptLanguage class >> standardName [
	^ 'shellcommands'
]

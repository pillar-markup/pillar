"
Bash scripting language
"
Class {
	#name : #PRBashScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRBashScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #requirement }
PRBashScriptLanguage class >> standardName [
	^ 'bash'
]

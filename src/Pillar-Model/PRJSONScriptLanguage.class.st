"
JSON
"
Class {
	#name : #PRJSONScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRJSONScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #requirement }
PRJSONScriptLanguage class >> standardName [
	^ 'json'
]

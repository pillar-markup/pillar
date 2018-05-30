"
General HTTP script language
"
Class {
	#name : #PRHTTPScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRHTTPScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #requirement }
PRHTTPScriptLanguage class >> standardName [
	^ 'http'
]

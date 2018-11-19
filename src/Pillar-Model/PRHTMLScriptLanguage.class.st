"
Hypertext markup language
"
Class {
	#name : #PRHTMLScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRHTMLScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #requirement }
PRHTMLScriptLanguage class >> standardName [
	^ 'html'
]

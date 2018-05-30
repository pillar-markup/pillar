"
Cascading stylesheet language
"
Class {
	#name : #PRCSSScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRCSSScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #protected }
PRCSSScriptLanguage class >> standardName [
	^ 'css'
]

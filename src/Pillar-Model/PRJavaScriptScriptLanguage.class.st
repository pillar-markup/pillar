"
JavaScript language
"
Class {
	#name : #PRJavaScriptScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRJavaScriptScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #protected }
PRJavaScriptScriptLanguage class >> standardName [
	^ 'javascript'
]

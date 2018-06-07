Class {
	#name : #PRCSSScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRCSSScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRCSSScriptLanguageTest >> actualClass [
	^ PRCSSScriptLanguage
]

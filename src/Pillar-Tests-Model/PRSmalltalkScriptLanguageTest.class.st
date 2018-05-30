Class {
	#name : #PRSmalltalkScriptLanguageTest,
	#superclass : #PRAbstractScriptLanguageTest,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #testing }
PRSmalltalkScriptLanguageTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSmalltalkScriptLanguageTest >> actualClass [
	^PRSmalltalkScriptLanguage 
]

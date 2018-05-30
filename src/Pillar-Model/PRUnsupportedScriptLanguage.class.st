"
An unsupported script language
"
Class {
	#name : #PRUnsupportedScriptLanguage,
	#superclass : #PRAbstractScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #'instance creation' }
PRUnsupportedScriptLanguage class >> default [
	<ignoreForCoverage>
	^ self shouldNotImplement
]

{ #category : #testing }
PRUnsupportedScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #protected }
PRUnsupportedScriptLanguage class >> standardName [

	^ 'unsupported language'
]

{ #category : #testing }
PRUnsupportedScriptLanguage >> isSpecified [
	^ false
]

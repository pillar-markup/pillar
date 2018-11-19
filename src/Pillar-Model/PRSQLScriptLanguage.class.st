"
SQL
"
Class {
	#name : #PRSQLScriptLanguage,
	#superclass : #PRRealScriptLanguage,
	#category : 'Pillar-Model-ScriptLanguage'
}

{ #category : #testing }
PRSQLScriptLanguage class >> isAbstract [
	^ false
]

{ #category : #protected }
PRSQLScriptLanguage class >> standardName [
	^ 'sql'
]

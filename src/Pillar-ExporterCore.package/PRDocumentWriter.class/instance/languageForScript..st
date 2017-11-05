helpers
languageForScript: aScript
	^ aScript language isSpecified
		ifTrue: [ aScript language ]
		ifFalse: [ self configuration defaultScriptLanguage ]
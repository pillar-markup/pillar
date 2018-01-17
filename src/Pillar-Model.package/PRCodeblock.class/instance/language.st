accessing-delegated
language
	^ self
		parameters at: 'language'
		ifPresent: [ :language | 
			language isString
				ifTrue: [ 
					| realObject |
					realObject := PRAbstractScriptLanguage for: language.
					self language: realObject.
					realObject ]
				ifFalse: [ language ] ]
		ifAbsent: [ PRUnspecifiedScriptLanguage default ]
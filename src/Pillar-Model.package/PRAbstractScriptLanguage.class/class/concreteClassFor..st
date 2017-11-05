private
concreteClassFor: aLanguageName
	aLanguageName isNil ifTrue: [ ^ PRUnspecifiedScriptLanguage ].
	^ (self withAllConcreteClasses copyWithout: PRUnsupportedScriptLanguage)
		detect: [ :cl | cl acceptLanguage: aLanguageName ]
		ifNone: [ PRUnsupportedScriptLanguage ]
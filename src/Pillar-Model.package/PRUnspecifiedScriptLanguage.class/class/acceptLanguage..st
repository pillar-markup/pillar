protected
acceptLanguage: aLanguageName
	^ aLanguageName isNil or: [ super acceptLanguage: aLanguageName ]
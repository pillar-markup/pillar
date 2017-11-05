protected
acceptLanguage: aLanguageName
	^ aLanguageName matchesRegexIgnoringCase: self acceptedLanguagesRegex 
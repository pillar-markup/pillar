descriptions transcripted to chrysal
descriptionDefaultScriptLanguage
	<magritteDescription>
	^ PRMagritteScriptLanguageDescription new
		priority: 100;
		accessor: #defaultScriptLanguage;
		label: 'Default language for scripts.';
		cocoonDocumentation:
				'Indicate the language in scripts when none is specified. This language is used for syntax highlighting. The currently supported languages are ', (PRRealScriptLanguage withAllConcreteClasses collect: #standardName) asCommaStringAnd, '.';
		default: PRUnspecifiedScriptLanguage default;
		cocoonDefaultDocumentation: 'An unspecified language';
		yourself
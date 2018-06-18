I'm a specific item for Pillar only configuration. 
I'm used to manage languages. 

Used for example this way

languageForScript: aScript
	^ aScript language isSpecified
		ifTrue: [ aScript language ]
		ifFalse: [ self configuration defaultScriptLanguage ]
		
	
scriptLanguages are defined that way in cocoon

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
		
	

PRRealScriptLanguage withAllConcreteClasses collect: #standardName 
>>> #('bash' 'css' 'html' 'http' 'json' 'javascript' 'pillar' 'sql' 'ston' 'shellcommands' 'smalltalk')

PRUnspecifiedScriptLanguage default 
>>> ''




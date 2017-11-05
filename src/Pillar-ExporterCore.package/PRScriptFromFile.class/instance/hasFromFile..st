testing
hasFromFile: aScript
	"I check if the transformer need to transform the script. If the script has bad parameters i raise a warning."

	aScript parameters
		at: 'firstLine'
		ifPresent: [ :lineNumber | 
			firstLine := lineNumber asInteger.
			firstLine isNotNil
				ifFalse: [ PRPropertyError signal: 'firstLine parameter must contains digits' ].
			aScript parameters
				at: 'fromFile'
				ifAbsent: [ 
					PRWarning signal: 'firstLine has to be with a fromFile parameter.'.
					^ false ] ].
	aScript parameters
		at: 'lastLine'
		ifPresent: [ :lineNumber | 
			lastLine := lineNumber asInteger.
			lastLine isNotNil
				ifFalse: [ PRPropertyError signal: 'lastLine parameter must contains digits' ].
			aScript parameters
				at: 'fromFile'
				ifAbsent: [ 
					PRWarning signal: 'lastLine has to be with a fromFile parameter.'.
					^ false ] ].
	aScript parameters
		at: 'fromFile'
		ifPresent: [ :fileName | 
			self setFileAndInterval: fileName.
			^ true ]
		ifAbsent: [ ^ false ]
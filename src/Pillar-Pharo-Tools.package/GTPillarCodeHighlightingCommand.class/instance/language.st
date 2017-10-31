accessing
language
	^ self properties 
		detect: [ :each | each key asLowercase = 'language' ]
		ifFound: [ :languagePair | languagePair value asLowercase ]
		ifNone: [ 'smalltalk' ]
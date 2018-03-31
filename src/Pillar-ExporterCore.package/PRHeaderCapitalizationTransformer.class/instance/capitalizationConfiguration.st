default
capitalizationConfiguration

	^ Dictionary
		with: 'upper case' -> [ :text | text asUppercase ]
		with: 'lower case' -> [ :text | text asLowercase ]
		with: 'capitalize' -> [ :text | self capitalizeHeader: text ]
		with: 'capitalize english' -> [ :text | self capitalizeEnglish: text ]
		with: 'raw' -> [ :text | text ]
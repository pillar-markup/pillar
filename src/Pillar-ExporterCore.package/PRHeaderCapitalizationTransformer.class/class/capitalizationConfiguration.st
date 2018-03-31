as yet unclassified
capitalizationConfiguration

	^ Dictionary
		with: 'upper case' -> [ :text | text asUppercase ]
		with: 'lower case' -> [ :text | text asLowercase ]
		with: 'capitalize' -> [ :text | self new capitalizeHeader: text ]
		with: 'capitalize english' -> [ :text | self new capitalizeEnglish: text ]
		with: 'raw' -> [ :text | text ]
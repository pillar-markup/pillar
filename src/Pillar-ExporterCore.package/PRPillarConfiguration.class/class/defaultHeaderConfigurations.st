accessing
defaultHeaderConfigurations
	^ Dictionary
		with: 'number' -> PRLevelNumberConfiguration
		with: 'roman' -> PRLevelRomanConfiguration
		with: 'letter' -> PRLevelLetterConfiguration
		with: 'upperLetter' -> PRLevelUpperLetterConfiguration yourself
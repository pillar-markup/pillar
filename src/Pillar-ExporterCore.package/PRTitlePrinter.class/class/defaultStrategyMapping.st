accessing
defaultStrategyMapping
	^ Dictionary
		with: 'number' -> PRLevelNumberPrinter
		with: 'roman' -> PRLevelRomanPrinter
		with: 'letter' -> PRLevelLetterPrinter
		with: 'upperLetter' -> PRLevelUpperLetterPrinter
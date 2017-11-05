class initialization
initialize
	" self initialize "

	PillarCharacters := Dictionary new.
	PRPillarGrammar markups
		valuesDo:
			[ :markup | 
			markup
				do:
					[ :char | 
					char = Character space
						ifFalse: [ PillarCharacters at: char put: '\' , char asString ] ] ]
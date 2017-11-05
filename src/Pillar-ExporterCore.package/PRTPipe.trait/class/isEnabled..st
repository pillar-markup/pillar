testing
isEnabled: aConfiguration
	^ (aConfiguration disabledPhases includes: self key) not
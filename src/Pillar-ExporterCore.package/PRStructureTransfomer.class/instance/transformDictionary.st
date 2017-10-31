visiting-annotations
transformDictionary
	^ Dictionary
		with: 'exercise' -> PRDefinitionListRenderer
		with: 'city' -> PRTableRenderer
		with: 'country' -> PRTableRenderer
		with: 'default' -> PRTableRenderer
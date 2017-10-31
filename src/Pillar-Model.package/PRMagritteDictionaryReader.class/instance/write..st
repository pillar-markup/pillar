action
write: aCollection
	| descriptions |
	dictionary := aCollection.
	descriptions := self sortDescriptions.
	annotationDictionary := aCollection class new.
	self visitAll: descriptions.
	self raiseWarningIfTooManyParameters.
	^ annotationDictionary
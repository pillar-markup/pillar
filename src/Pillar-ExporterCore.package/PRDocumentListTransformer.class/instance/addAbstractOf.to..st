adding
addAbstractOf: aFileReference to: aDocument
	 (self getFirstElementsOf: aFileReference) do: [ :each | aDocument add: each ]
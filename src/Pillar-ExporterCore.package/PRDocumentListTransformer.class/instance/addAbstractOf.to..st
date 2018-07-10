adding
addAbstractOf: aFileReference to: aDocument
	 ^ (self getFirstElementsOf: aFileReference) do: [ :each | PRRaw content: each ]
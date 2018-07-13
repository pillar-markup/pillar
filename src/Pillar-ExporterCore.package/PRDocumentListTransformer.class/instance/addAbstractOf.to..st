adding
addAbstractOf: aFileReference to: aDocument
	^ (self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [ | previousContent |
		previousContent := aDocument text.
		aDocument text: previousContent , (self getFirstElementsOf: aFileReference) ] 
	ifFalse: [ (self getFirstElementsOf: aFileReference) do: [ :each | aDocument add: each ] ]
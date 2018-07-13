adding
addAbstractOf: aFileReference to: aDocument
	^ (self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [ (self getFirstElementsOf: aFileReference) do: [ :each | aDocument text: each ] ] 
	ifFalse: [ (self getFirstElementsOf: aFileReference) do: [ :each | aDocument add: each ] ]
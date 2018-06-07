converting
asCTEnvironmentWithParent: aParent
	| dictionary |
	dictionary := CTEnvironment new.
	dictionary parent: aParent.
	
	dictionary at: #name put: name.
	dictionary at: #level put: level.
	self hasFileReference ifTrue: [ 
		dictionary
			at: #href
			put: '/', (self changeFileExtension: fileReference) , '#' , self name asLowercase.
	].
	dictionary at: #hasChildren put: self children isNotEmpty.
	dictionary at: #children put: (self children collect: [ :each | 
		each asCTEnvironmentWithParent: dictionary ]).
	^ dictionary
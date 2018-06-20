converting
asDictionary
	| dictionary |
	dictionary := Dictionary new.
	dictionary at: #name put: name.
	dictionary at: #level put: level.
	self hasFileReference ifTrue: [ 
		dictionary
			at: #href
			put: '/', (self changeFileExtension: fileReference) , '#' , self name asLowercase.
	].
	dictionary at: #hasChildren put: self children isNotEmpty.
	dictionary at: #children put: (self children collect: [ :each | 
		each asDictionary
			at: #parent put: dictionary;
			yourself ]).
	^ dictionary
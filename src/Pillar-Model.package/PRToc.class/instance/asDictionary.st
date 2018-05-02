converting
asDictionary
	^ Dictionary new
		at: #name put: name;
		at: #level put: level;
		at: #fileRef put: fileRef;
		at: #hasChildren put: self children isNotEmpty;
		at: #children put: (self children collect: [ :each | each asDictionary ]);
		yourself
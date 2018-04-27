converting
asDictionary
	^ Dictionary new
		at: #name put: name;
		at: #level put: level;
		at: #fileRef put: fileRef;
		at: #children put: (self children collect: [ :each | each asDictionary ]);
		yourself
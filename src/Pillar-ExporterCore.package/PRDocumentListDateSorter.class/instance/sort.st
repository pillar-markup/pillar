sorting
sort
	^ files sort: [ :a :b | 
		direction < 0 ifTrue: [a modificationTime > b modificationTime ]
		ifFalse: [a modificationTime < b modificationTime]]
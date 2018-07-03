initialization
sort
	^ files sort: [ :a :b | 
		direction > 0 ifTrue: [a basename < b basename ]
		ifFalse: [a basename > b basename]]
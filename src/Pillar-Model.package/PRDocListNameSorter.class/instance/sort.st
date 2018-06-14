initialization
sort
	^ files sort: [ :a :b | a basename < b basename ]
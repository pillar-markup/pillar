building suites
testSelectors
	^ self selectors select: [ :each | (each beginsWith: 'test') ]
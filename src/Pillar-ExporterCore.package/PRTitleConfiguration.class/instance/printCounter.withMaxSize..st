rendering
printCounter: aCollection withMaxSize: aSize
	^ String streamContents: [ :s | self printCounter: aCollection withMaxSize: aSize on: s ]
	
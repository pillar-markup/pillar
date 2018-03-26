rendering
printCounter: aCollection
	^ String streamContents: [ :s | self printCounter: aCollection withMaxSize: self size on: s ]

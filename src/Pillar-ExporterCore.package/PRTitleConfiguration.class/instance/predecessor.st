accessing
predecessor
	^ self level = 1
		ifTrue: [ nil ]
		ifFalse: [ self configuration perform: ('level' , (self level - 1) asString) asSymbol ]
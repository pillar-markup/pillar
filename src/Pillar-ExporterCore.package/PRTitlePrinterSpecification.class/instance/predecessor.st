accessing
predecessor
	^ level = 1
			ifTrue: [ nil ]
			ifFalse: [ self printer perform: ('level' , (self level - 1) asString) asSymbol ]
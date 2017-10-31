rendering
printCounter: aCollection withMaxSize: aSize
	| stream |
	stream := String new writeStream.
	aSize > 0
		ifTrue: [ 
			(self predecessor isNotNil and: [ aSize - 1 > 0 ])
				ifTrue: [ 
					stream nextPutAll: (self predecessor printCounter: aCollection allButLast withMaxSize: aSize - 1).
					aCollection allButLast last = -1
						ifFalse: [ stream nextPut: self elementSeparator ] ].
			stream nextPutAll: (self printElement: aCollection last) ].
	^ stream contents
rendering
printCounter: aCollection withMaxSize: aSize on: stream
	aSize > 0
		ifTrue: [ (self predecessor isNotNil and: [ aSize - 1 > 0 ])
				ifTrue: [ self predecessor printCounter: aCollection allButLast withMaxSize: aSize - 1 on: stream.
					aCollection allButLast last = -1
						ifFalse: [ stream nextPut: self elementSeparator ] ].
			self printElement: aCollection last on: stream ]
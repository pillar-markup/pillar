descriptions
asPillarParametersOn: aStream
	self parameters
		at: 'note'
		ifPresent: [ :v | 
			self asPillarKey: 'note' value: v asString on: aStream ]
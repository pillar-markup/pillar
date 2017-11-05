protected
add: anObject toCurrentEnvironmentOr: aBlock
	currentColumn isNil & currentColumns isNil
		ifTrue: [ ^ aBlock value ].
	self delete.
	currentColumn
		ifNotNil: [ currentColumn add: anObject ]
		ifNil: [ currentColumns add: anObject ]
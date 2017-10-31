accessing
indexOfLastNonZero
	counters size to: 1 by: -1 do: [ :index | 
		(counters at: index) strictlyPositive
			ifTrue: [ ^ index ] ].
	^ 1
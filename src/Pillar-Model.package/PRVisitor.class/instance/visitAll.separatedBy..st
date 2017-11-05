visiting
visitAll: aCollection separatedBy: aBlock
	aCollection do: [ :each | self visit: each ] separatedBy: aBlock
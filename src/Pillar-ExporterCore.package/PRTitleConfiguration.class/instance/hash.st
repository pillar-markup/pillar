comparing
hash
	^ self species hash bitXor: (self predecessor hash bitXor: numbering hash)
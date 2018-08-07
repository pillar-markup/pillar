comparing
hash
	^ ((super hash 
		bitXor: self parameters hash)
		bitXor: self hadAllKeys hash)
		bitXor: self isValid hash
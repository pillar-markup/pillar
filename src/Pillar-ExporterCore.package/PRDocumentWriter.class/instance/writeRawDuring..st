helpers
writeRawDuring: aBlock
	[ 
	writingRaw := true.
	aBlock value ]
		ensure: [ writingRaw := false ]
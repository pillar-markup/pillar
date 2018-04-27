comparing
hashChildren
	^ (self children collect: [ :elem | elem hash ])
		inject: 0
		into: [ :sum :value | sum + value ]
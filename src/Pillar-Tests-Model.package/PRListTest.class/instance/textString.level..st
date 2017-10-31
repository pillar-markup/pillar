private
textString: anObject level: anInteger
	^ (2 to: anInteger) inject: '' into: [ :result :each | result , '	' ]
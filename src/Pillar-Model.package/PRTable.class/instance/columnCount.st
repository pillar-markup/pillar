accessing
columnCount
	^ self children inject: 0 into: [ :max :row | max max: row columnCount ]
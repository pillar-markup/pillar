accessing
leveln: anInteger

	^ self perform: ('level', anInteger asString) asSymbol 
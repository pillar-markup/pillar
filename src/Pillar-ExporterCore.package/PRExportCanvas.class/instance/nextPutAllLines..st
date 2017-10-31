writing text
nextPutAllLines: aString
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
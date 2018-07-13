helpers
testParsedHadAllKeys

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation account equals: 'QDucasse'.
	self assert: annotation project equals: 'MetacelloTestBook-Code'.
	self assert: annotation baseline equals: 'MetacelloTestBook'.
	self assert: annotation gitTag equals: 'Chapter1'.
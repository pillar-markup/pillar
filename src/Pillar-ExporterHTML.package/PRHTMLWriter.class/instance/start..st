visiting
start: anObject
	canvas := PRHTMLCanvas on: stream.
	footnoteID := 0.
	noteDictionary := Dictionary new.
	super start: anObject.
	self noteAtEnd.
	canvas flush
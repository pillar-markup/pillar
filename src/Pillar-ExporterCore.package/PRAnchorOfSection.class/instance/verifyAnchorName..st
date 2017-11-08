private
verifyAnchorName: aString
	"Verify an anchor name, if it has the form 'anchorName@aNumber', the occurence number on  the dictionary is changed by aNumber if it is greater than the occurence and if anchorName is a key on the dictionary"
	| anchorParts anchorLastPart realAnchorName |
	
	anchorParts := (aString substrings: '@') asOrderedCollection.
	(anchorParts size > 1)  ifFalse: [ ^ self ].
	anchorLastPart := (anchorParts at: (anchorParts size)).
	
	anchorLastPart asNumber isNumber 
		ifTrue: [ anchorParts removeAt: (anchorParts size) ].
	
	realAnchorName := anchorParts inject: '' into: [ :substring :next | substring , next ].
	
	((occurenceOfHeader at: realAnchorName ifAbsent: [ true ]) or: [ (occurenceOfHeader at: realAnchorName) > (anchorLastPart asNumber) ])
		ifTrue: [ occurenceOfHeader at: realAnchorName put: (anchorLastPart asNumber) ].
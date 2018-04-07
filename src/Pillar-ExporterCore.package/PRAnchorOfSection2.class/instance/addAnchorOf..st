adding
addAnchorOf: aPRHeader

	| anchorText headerText |
	headerText := aPRHeader headerText.
	
	occurenceOfHeader at: headerText ifAbsentPut: 0.
	occurenceOfHeader at: headerText put: ((occurenceOfHeader at: headerText) + 1).
	
	anchorText := headerText , self class charForAnchorOccurence , (occurenceOfHeader at: headerText) asString .
	^ Array with: aPRHeader with: (PRAnchor named: anchorText)
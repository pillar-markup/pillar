private
initOccurenceOfAnchor: aGroup
	occurenceOfHeader := Dictionary new.
	(aGroup children)
		do: [ :child | 
			child class = PRAnchor
				ifTrue: [ self verifyAnchorName: (child name) ] ].
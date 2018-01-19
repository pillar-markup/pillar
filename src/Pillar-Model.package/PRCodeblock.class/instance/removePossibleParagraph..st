as yet unclassified
removePossibleParagraph: content
	^ (content first class = PRParagraph ) ifTrue:[ content first children ] ifFalse: [ content ]
accessing
currentSectionIndex
	"I return the index of deeper section open now. If I don't have any section open I return -1."

	| index |
	index := MaxDepthLevel.
	sections reverse
		do: [ :each | 
			each isNotNil
				ifTrue: [ ^ index ].
			index := index - 1 ].
	^ -1
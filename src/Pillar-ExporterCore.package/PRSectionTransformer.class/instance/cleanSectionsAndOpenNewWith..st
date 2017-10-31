private
cleanSectionsAndOpenNewWith: documentItem
	| newSection |
	documentItem level <= MaxDepthLevel
		ifTrue: [ self cleanSectionsUnderLevel: documentItem level.
			newSection := PRSection with: documentItem.
			sections at: documentItem level put: newSection ]
		ifFalse: [ self currentSection add: documentItem ].
	^ newSection
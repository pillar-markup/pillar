private
manageItem: documentItem
	^ documentItem isHeader
		ifTrue: [ self cleanSectionsAndOpenNewWith: documentItem ]
		ifFalse: [ 
			self aSectionIsOpen
				ifTrue: [ self currentSection add: documentItem ]
				ifFalse: [ newChildren add: documentItem ] ]
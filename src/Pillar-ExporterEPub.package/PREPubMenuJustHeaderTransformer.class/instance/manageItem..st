private
manageItem: aDocumentItem
	| newSection parent |
	^ (aDocumentItem isHeader and: [ aDocumentItem level = maxHeader ])
		ifTrue: [ newSection := self cleanSectionsAndOpenNewWith: aDocumentItem.
			self initCurrentsArray.
			currentsArray at: maxHeader put: newSection ]
		ifFalse: [ aDocumentItem isHeader
				ifTrue: [ parent := self sectionToLinkWith: aDocumentItem.
					newSection := PRSection with: aDocumentItem.
					parent add: newSection.
					currentsArray at: aDocumentItem level put: newSection ]
				ifFalse: [ aDocumentItem isGroup
						ifTrue: [ aDocumentItem children do: [ :each | self manageItem: each ] ] ] ]
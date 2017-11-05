private
listItemWithText: aString
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
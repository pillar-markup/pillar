private
escape: aString using: aSearchString
	| string index escapedMarkup |
	string := aString.
	escapedMarkup := self escapeMarkup: aSearchString.
	index := string findString: aSearchString.
	[ index > 0 ] whileTrue: [
		string := (string first: index - 1) , escapedMarkup , (string allButFirst: index - 1 + aSearchString size).
		index := string findString: aSearchString startingAt: index + escapedMarkup size].
	^ string
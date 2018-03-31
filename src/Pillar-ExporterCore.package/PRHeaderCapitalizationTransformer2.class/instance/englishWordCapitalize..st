visiting-document
englishWordCapitalize: aWord

	^  (self nonCapitalizedWordEnglish includes: aWord)
					ifTrue: [ aWord ]
					ifFalse: [ aWord capitalized ]
					
	
	

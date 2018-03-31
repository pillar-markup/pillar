visiting-document
englishWordCapitalize: aWord

	^  (self class nonCapitalizedWordEnglish includes: aWord)
					ifTrue: [ aWord ]
					ifFalse: [ aWord capitalized ]
					
	
	

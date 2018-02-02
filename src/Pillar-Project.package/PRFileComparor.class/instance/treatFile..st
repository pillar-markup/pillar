accessing
treatFile: aFile

	(self isDefinedInTarget: aFile)
		ifFalse: [ self copyToTarget: aFile.
					^ self ].
	(self isOldInTarget: aFile)	
		ifTrue: [ self copyToTarget: aFile. 
				^ self ].
	
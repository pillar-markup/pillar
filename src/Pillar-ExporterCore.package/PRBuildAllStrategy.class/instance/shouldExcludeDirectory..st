private - testing
shouldExcludeDirectory: aFileReference 
	
	^ aFileReference basename beginsWithAnyOf: #( '.' '_' )
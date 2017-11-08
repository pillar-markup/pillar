private - testing
shouldExcludeDirectory: aFileReference 
	
	^ #( 'support' 'build' '_result' ) includes: aFileReference basename
instance creation
on: aStream 	
	"I generate the documentation of the scripts languages on a Stream."
	
	^self new 
		stream: aStream;
		generateDoc;
		stream
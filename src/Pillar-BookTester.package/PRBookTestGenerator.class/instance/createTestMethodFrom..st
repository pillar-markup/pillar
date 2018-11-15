visiting
createTestMethodFrom: aCodeblock
	"The test method is compiled using the following template, either it raises no exception:
	test(cbIndex)
	
		self assert: (ourAssociation) isPaired
	
	or it raises one:
	test(cbIndex)
	
		self assert: false description: [ theCodeBlock test raised the exception: (theException) ]"
		
	[ (self class environment at: fileName asSymbol) compile: 'test' , cbIndex asString,'
	
	self assert: (' , aCodeblock textForExample withSeparatorsCompacted, ') isPaired' ]
		on: Exception 
		do: [ :e |(self class environment at: fileName asSymbol) compile: 
			
			(String streamContents: [ :s | 
				s << 'test' << cbIndex asString.
				s cr; cr; tab.	
				s << 'self assert: Error signal description: ''A code block failed''. '.
				s cr; tab. 
				s << '"' << e class name << ' was raised with: ' << (e messageText copyWithout:$") << '"'.
				s cr; tab.
				s << '"' << 'by the codeblock: ' << (aCodeblock textForExample withSeparatorsCompacted copyWithout:$") << '"'])]
		
	

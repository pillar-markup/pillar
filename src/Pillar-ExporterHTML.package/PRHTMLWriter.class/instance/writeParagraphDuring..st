writing
writeParagraphDuring: aBlockClosure 
	
	canvas tag
		name: 'p';
		with: [ 
			canvas newLine.
			aBlockClosure value.
			canvas newLine ]
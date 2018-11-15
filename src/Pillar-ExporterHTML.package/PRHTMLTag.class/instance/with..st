accessing
with: aString
	stream 
		nextPut: $>; 
		<< aString;
		<< '</'; 
		<< name;
		nextPut: $>
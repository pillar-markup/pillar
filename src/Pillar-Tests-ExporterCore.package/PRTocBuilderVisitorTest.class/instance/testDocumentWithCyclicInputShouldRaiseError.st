tests
testDocumentWithCyclicInputShouldRaiseError
	| document |
	document := PRPillarParser
		parse:
			'
! Test1
!! Test2

${inputFile:value=cyclic1.pillar}$

!! Test3'.

	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar').
		
	self should: [ builder visit: document ] raise: PRCyclicFileInclusionError
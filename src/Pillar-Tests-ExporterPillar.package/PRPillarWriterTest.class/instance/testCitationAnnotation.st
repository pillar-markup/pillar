tests
testCitationAnnotation

	| input |
	input := PRDocument new
		add:
			(PRCitationAnnotation new
				parameterAt: 'ref' put: 'foo';
				yourself).
	self assertWriting: input includesText: '${cite:ref=foo}$'
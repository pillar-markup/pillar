S. Ducasse comment: 

It looks like this class is actually doing nothing since it just stores two values and returns value. Most of the time people write

(PRCompilationContext 
	withDocument: anInput
	withConfiguration: 'ljkjlkjkl') input
	
(PRCompilationContext 
	withDocument: 'jkljlkj'
	withConfiguration: 'ljkjlkjkl') input

But PRCheckPhase uses the configuration passed bt the context. 

executeOn: aPillarContext
	self new
		configuration: aPillarContext configuration;
		start: aPillarContext input.
	^ aPillarContext
	

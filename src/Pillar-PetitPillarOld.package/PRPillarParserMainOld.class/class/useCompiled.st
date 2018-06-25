compiled parser
useCompiled
	^ UseCompiledParser ifNil: [ self beCompiled. UseCompiledParser ]
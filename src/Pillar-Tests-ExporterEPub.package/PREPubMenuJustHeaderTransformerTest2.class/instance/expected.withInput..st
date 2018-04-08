tests
expected: expected withInput: input
	self
		assert:
			(self
				executePhase: input
				with:
					(self configuration
						propertyAt: #_outputFormat put: self actualWriterClass new;
						yourself))
		equals: expected
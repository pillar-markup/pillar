visiting-description
visitPathDescription: aDescription
	self tryToAddFrom: aDescription withInterpretation: [ :value | value printWithDelimiter: $/ ]
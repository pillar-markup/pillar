tests-templatefiles
testWriteHeaderUsesHeaderTemplate

	self
		assertTemplate: PRTemplatedWriter headerTemplateFileName
		writesValue: 'aHeader'
		forNode: (PRHeader new
			level: 2;
			add: (PRText content: 'foo'))
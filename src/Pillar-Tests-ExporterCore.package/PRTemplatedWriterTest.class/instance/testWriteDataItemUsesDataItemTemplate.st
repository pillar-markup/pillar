tests-templatefiles
testWriteDataItemUsesDataItemTemplate

	self
		assertTemplate: PRTemplatedWriter dataItemTemplateFileName
		writesValue: 'dataitem'
		forNode: PRDataItem new
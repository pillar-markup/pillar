tests
testFillFrom
	| specTarget specSource |
	specTarget := PRTitlePrinterSpecification new. 
	specSource := PRTitlePrinterSpecification new. 
	specSource level:3. 
	specSource size: 55. 
	specSource renderAs: 'roman'.
	specSource numbering: true.
	specSource capitalization: 'capitalize english'.
	
	specTarget fillFromAnother: specSource. 
	self assert: specTarget level equals: 3.
	self assert: specTarget size equals: 55.
	self assert: specTarget renderAs equals: 'roman'.
	self assert: specTarget numbering equals: true.
	self assert: specTarget capitalization equals:  'capitalize english'.
	
	
	 
running
testTransformerIsWorking
	| doc documentGroup sections |
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'packageName' put: 'Kernel';
					parameterAt: 'className' put: 'Integer';
					parameterAt: 'methodName' put: '+';
					parameterAt: 'caption' put: 'The addition method for integers';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'add';
				yourself).
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	self halt.
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	documentGroup := doc children first.
	sections := documentGroup children. 
	
	self assert: sections size equals: 2.
	self assert: sections first children second children size equals: 3.
	self assert: sections second children second children size equals: 2.
	self assert: sections first children first text equals: 'Refereed Articles in International Conferences'
	
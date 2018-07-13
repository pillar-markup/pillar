running
testTransformerIsWorking
	| doc documentGroup sections pictureName |
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
	
	self assert: (FileSystem workingDirectory / 'figures' / 'images-Integer>>+.png') isFile.
	self assert: sections first children second children size equals: 3.
	
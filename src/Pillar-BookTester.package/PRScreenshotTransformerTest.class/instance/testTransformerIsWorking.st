running
testTransformerIsWorking
	| doc documentGroup |
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
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	documentGroup := doc children first.
	
	"Let's first test that the png file has been created following the correct template"
	self assert: (FileSystem workingDirectory / 'figures' / ((FileSystem workingDirectory basename), '-Integer>>+.png')) isFile.
	"Then, let's test that a figure reference has been added to the document"
	
	
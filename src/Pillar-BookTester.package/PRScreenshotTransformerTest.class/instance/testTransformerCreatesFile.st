running
testTransformerCreatesFile
	| doc figure |
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'packageName' put: 'Kernel';
					parameterAt: 'className' put: 'Integer';
					parameterAt: 'methodName' put: 'isPowerOfTwo';
					parameterAt: 'caption' put: 'The method determining if an integer is a power of two';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'times2';
				yourself).
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	figure := doc children first.
	"Let's first test that the png file has been created following the correct template"
	self assert: (FileSystem workingDirectory / 'figures' / ((FileSystem workingDirectory basename), '-Integer>>isPowerOfTwo.png')) isFile.
	
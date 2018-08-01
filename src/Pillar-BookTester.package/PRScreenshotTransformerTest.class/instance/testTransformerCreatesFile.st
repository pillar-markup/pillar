running
testTransformerCreatesFile
"It is needed to create the subfolder image/YourImage/figures as if it was a book in order for these tests to work"
	| doc |
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'packageName' put: 'Kernel';
					parameterAt: 'className' put: 'Integer';
					parameterAt: 'methodName' put: 'isPowerOfTwo';
					parameterAt: 'caption' put: 'The method determining if an integer is a power of two';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'times2';
				yourself); yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	"Let's test that the png file has been created and follows the correct template"
	self assert: (FileSystem workingDirectory / 'figures' / ((FileSystem workingDirectory basename), '-Integer>>isPowerOfTwo',(((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first,'.png')) isFile.
	
running
testTransformerCreatesFile
"It is needed to create the subfolder image/YourImage/figures as if it was a book in order for these tests to work"
	| doc |
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'class' put: 'Integer';
					parameterAt: 'method' put: 'isPowerOfTwo';
					parameterAt: 'caption' put: 'The method determining if an integer is a power of two';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'times2';
				yourself); yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	"Let's test that the png file has been created and follows the correct template"
	self assert: (FileSystem workingDirectory / 'figures' / 'screenshots')  hasChildren.
	self assert: ((FileSystem workingDirectory / 'figures' / 'screenshots')  allFiles detect: 
							[:any |any basename match: 'Integer>>isPowerOfTwo','-',(DateAndTime now hour asString),'-',(DateAndTime now minute asString)])
	
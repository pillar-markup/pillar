running
testTransformerCreatesFile
"It is needed to create the subfolder image/YourImage/figures as if it was a book in order for these tests to work"
	| doc dateStamp |
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
	dateStamp := (String streamContents:
					[ :s | s << 'Integer>>isPowerOfTwo'. 
						    s << ('-', ((DateAndTime year: (DateAndTime now year) 
											       month: (DateAndTime now month) 
											       day: (DateAndTime now dayOfMonth)) 
										asString splitOn:'T') first).
						    s << ('T',(DateAndTime now hour asString)).
						    s	<< ('-',(DateAndTime now minute asString)).
							 s << '*'	]). 
	self assert: ((FileSystem workingDirectory / 'figures' / 'screenshots')  allFiles 
	     anySatisfy: [:any | dateStamp match: any basename ])
	
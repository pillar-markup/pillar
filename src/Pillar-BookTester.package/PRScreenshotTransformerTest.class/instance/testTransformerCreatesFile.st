running
testTransformerCreatesFile
	"The test may fail if launched at a when changing minutes if you are unlucky"
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
	dateStamp := (String streamContents:
					[ :s | s << 'Integer>>isPowerOfTwo'. 
						    s << (('-', ((DateAndTime year: (DateAndTime now year) 
											       month: (DateAndTime now month) 
											       day: (DateAndTime now dayOfMonth)
													 hour: (DateAndTime now hour)
												    minute: (DateAndTime now minute))
										asString splitOn:(DateAndTime now minute) asString) first) copyReplaceAll: ':' with: '-').
							s << '*']).
						    
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	self assert: (FileSystem workingDirectory / 'figures' / 'screenshots')  hasChildren.
	self deny: ((FileSystem workingDirectory / 'figures' / 'screenshots')  childrenMatching: dateStamp) isEmpty.
	
running
testTransformerCreatesFigureReference
"It is needed to create the subfolder image/YourImage/figures as if it was a book in order for these tests to work"
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
				yourself); yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	figure := doc children first.
	"Let's test that a figure reference has been added to the document with the correct parameters"
	self assert: figure class equals: PRFigure.
	self assert: figure hasCaption.
	self assert: figure hasLabel.
	self assert: figure parameters equals: 
				(OrderedDictionary new
					add: 'width' -> 50;
					add: 'label' -> 'times2'; 
					yourself).

	
	
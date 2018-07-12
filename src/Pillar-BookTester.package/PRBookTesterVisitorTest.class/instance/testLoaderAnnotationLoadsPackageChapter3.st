tests-annotations
testLoaderAnnotationLoadsPackageChapter3
	| doc bookTester|
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter3';
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (self class environment includes: #Plop).
	self assert: Plop new chapterOneMethod equals: 'chapterThree'.
	self assert: Plop new chapterTwoMethod equals: 'chapterTwo'.
	self assert: Plop new chapterThreeMethod equals: 'chapterThree'
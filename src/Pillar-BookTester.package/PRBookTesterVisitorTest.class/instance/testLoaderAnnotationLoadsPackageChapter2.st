tests-annotations
testLoaderAnnotationLoadsPackageChapter2
	| doc bookTester|
	
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter2';
					parameterAt: 'baseline' put: 'MetacelloTestBook';
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (self class environment keys includes: #Plop).
	self assert: Plop new chapterOneMethod equals: 'chapterOne'.
	self assert: Plop new chapterTwoMethod equals: 'chapterTwo'
	
	
	
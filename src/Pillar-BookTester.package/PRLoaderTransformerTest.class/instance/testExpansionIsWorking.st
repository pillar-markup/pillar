private
testExpansionIsWorking
	| doc |
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter3';
					yourself);
				yourself.
				
	((PRLoaderTransformer withContext: (PRProject on: testingFileSystem )) start: doc).

	self assert: Plop new chapterOne equals: 'chapterThree'.
	self assert: Plop new chapterTwo equals: 'chapterTwo'.
	self assert: Plop new chapterThree equals: 'chapterThree'.
tests
testSameTocsHaveSameHashValue
	| toc1 toc2 |
	toc1 := PRToc new
		name: 'test1';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	toc2 := PRToc new
		name: 'test1';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	self assert: toc1 equals: toc2.
	self assert: toc1 hash equals: toc2 hash
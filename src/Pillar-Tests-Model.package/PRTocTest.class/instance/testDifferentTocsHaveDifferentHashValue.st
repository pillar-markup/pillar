tests
testDifferentTocsHaveDifferentHashValue
	| toc1 toc2 |
	toc1 := PRToc new
		name: 'test5';
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
	self deny: toc1 = toc2.
	self deny: toc1 hash = toc2 hash
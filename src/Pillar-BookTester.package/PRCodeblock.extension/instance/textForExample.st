*Pillar-BookTester
textForExample
	"returns a preformated text for codeblock testing"
	"(PRCodeblock content: ' 3+4 >>> 7 ' parameters: (OrderedDictionary newFromKeys: #('testcase') andValues: #(true))) textForTestcase 
	  >>> '(3+4)>>>7'"
	
	('*>>>*' match: self text)
			ifTrue: [ ^ '(', (self text splitOn: '>>>') first trimBoth, 
				         ')','>>>', (self text splitOn: '>>>') second trimBoth ]
			ifFalse: [ ^ self text ]
	 
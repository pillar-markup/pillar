*Pillar-BookTester
textForTests
	"returns a preformated text for codeblock testing"
	"(PRCodeblock content: '3+4>>>7' parameters: nil) textForTests >>> '(3+4)>>>7'"
	
	('*>>>*' match: self text)
			ifTrue: [ ^ '(', (self text splitOn: '>>>') first , 
				         ')','>>>', (self text splitOn: '>>>') second ]
			ifFalse: [ ^ self text ]
	 
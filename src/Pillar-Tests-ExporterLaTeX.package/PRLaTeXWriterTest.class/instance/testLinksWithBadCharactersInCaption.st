tests
testLinksWithBadCharactersInCaption
	| item url caption |
	url := 'http://www.pharo.org'.
	caption := 'bad chars #_'.
	item := PRExternalLink new
		reference: url;
		add: (PRText content: caption);
		yourself.
	self assertWriting: item includesText: 'bad chars \#\_'
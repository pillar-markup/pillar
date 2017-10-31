tests
testLinksWithEitherHrefOrUrl
	| item url caption |
	url := 'http://www.pharo.org#foo'.
	caption := 'some caption'.
	item := PRExternalLink new reference: url.
	self assertWriting: item includesText: '\url{' , url , '}'.
	item := PRExternalLink new
		reference: url;
		add: (PRText content: caption);
		yourself.
	self assertWriting: item includesText: '\href{' , url , '}{' , caption , '}'
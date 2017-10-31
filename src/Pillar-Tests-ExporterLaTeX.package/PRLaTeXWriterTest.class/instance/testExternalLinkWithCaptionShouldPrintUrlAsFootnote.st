tests-internalLinks
testExternalLinkWithCaptionShouldPrintUrlAsFootnote
	| link |
	link := self addText: 'Pharo' to: (PRExternalLink reference: 'http://www.pharo.org').
	self assertWriting: link includesText: '\href{http://www.pharo.org}{Pharo}\footnote{\url{http://www.pharo.org}}'
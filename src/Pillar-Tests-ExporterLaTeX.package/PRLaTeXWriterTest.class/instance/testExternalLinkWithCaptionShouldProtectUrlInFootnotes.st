tests-internalLinks
testExternalLinkWithCaptionShouldProtectUrlInFootnotes
	| link |
	link := self addText: 'Launcher' to: (PRExternalLink reference: 'http://www.smalltalkhub.com/#!/~Pharo/PharoLauncher').
	self assertWriting: link includesText: '\footnote{\url{http://www.smalltalkhub.com/\#!/~Pharo/PharoLauncher}}'
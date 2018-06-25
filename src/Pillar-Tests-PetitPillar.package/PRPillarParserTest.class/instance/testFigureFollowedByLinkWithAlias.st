tests - Reference
testFigureFollowedByLinkWithAlias
	| paragraph |
	super testFigureFollowedByLinkWithAlias.
	paragraph := PRParagraph withAll: { 
		PRFigure reference: 'file://TeapotWelcome.png'.
		(PRExternalLink reference: 'http://localhost')
			add: (PRText content: 'Go');
			yourself
	 }.
	self assert: result equals: paragraph.
	self assertStart: 1 stop: 47.
	self assertStart: 1 stop: 26 ofNode: result children first.
	self assertStart: 27 stop: 47 ofNode: result children second.
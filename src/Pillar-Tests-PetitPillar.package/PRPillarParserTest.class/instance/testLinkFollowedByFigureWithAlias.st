tests - Reference
testLinkFollowedByFigureWithAlias
	| paragraph |
	super testLinkFollowedByFigureWithAlias.
	paragraph := PRParagraph withAll: { 
		PRExternalLink reference: 'http://localhost'.
		(PRFigure reference: 'file://TeapotWelcome.png')
			add: (PRText content: 'Go');
			yourself
	 }.
	self assert: result equals: paragraph.
	self assertStart: 1 stop: 47.
	self assertStart: 1 stop: 18 ofNode: result children first.
	self assertStart: 19 stop: 47 ofNode: result children second.
	self flag: 'PRText should have start and stop values set to 20 and 21, but has 1 and 2'.
	"self assertStart: 20 stop: 21 ofNode: result children second children first."
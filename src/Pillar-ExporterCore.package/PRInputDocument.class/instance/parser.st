accessing
parser
	
	file extension = 'pillar'
		ifTrue: [ ^ PRDocument parser ].
	self error: 'No parser for document extension: ', file extension
parsing
parseProperties: stream
	| ston isSton |
	isSton := stream next = ${ and: [ stream peek ~~ ${ ].
	stream skip: -1.
	ston := isSton
		ifTrue: [ (STON reader on: stream) next ]
		ifFalse: [ Dictionary new ].
	^ ston
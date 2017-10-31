accessing
title
	^ self renderAsText isEmpty
		ifTrue: [ nil ]
		ifFalse: [ self renderAsText ]
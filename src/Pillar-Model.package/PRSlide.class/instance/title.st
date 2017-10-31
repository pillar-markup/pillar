accessing
title
	^ title isNotNil
		ifTrue: [ title ]
		ifFalse: [ 'New Slide' ]
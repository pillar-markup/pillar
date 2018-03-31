protected
raiseErrorIfTooManyDefaultParameters: nilParameters
	nilParameters > 1
		ifTrue: [ PRError signal: 'More than one parameter have no key in ' , self tag , ' annotation.' ]
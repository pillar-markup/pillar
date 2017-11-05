helpers
writeGraphicsParametersOfExternalLink: anExternalLink
	canvas
		nextPutAll: 'width=';
		nextPutAll: ((anExternalLink parameters at: 'width' ifAbsent: [ 100 ]) asNumber / 100.0) printString;
		raw: '\textwidth'
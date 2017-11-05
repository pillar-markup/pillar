visiting-description
checkRequired: accessor with: aDescription
	^ aDescription required
		ifTrue: [ PRPropertyError signal: accessor , ' is a required parameter on a ' , class tag , ' annotation' ]
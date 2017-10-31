action
updateInterval
	| fileLineNumber |
	fileLineNumber := self fileLineNumber.
	firstLine isNil
		ifTrue: [ firstLine := 1 ]
		ifFalse: [ 
			firstLine <= fileLineNumber
				ifFalse: [ 
					PRPropertyError
						signal: 'firstLine parameter is not a valid parameter. Please choose a firstLine lower than the file size.' ] ].
	lastLine isNil
		ifTrue: [ lastLine := fileLineNumber ]
		ifFalse: [ 
			(lastLine >= firstLine and: [ lastLine <= fileLineNumber ])
				ifFalse: [ 
					PRPropertyError
						signal:
							'lastLine parameter is not a valid parameter. Please choose a lastLine lower than the file size and higher then the firstLine.' ] ]
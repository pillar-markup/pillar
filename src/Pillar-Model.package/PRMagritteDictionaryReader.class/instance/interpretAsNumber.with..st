action
interpretAsNumber: value with: aDescription
	value
		do: [ :each | 
			each isDigit
				ifFalse: [ 
					PRError
						signal:
							aDescription accessor readSelector , ' must be a number in ' , class tag , ' annotation. Receive : ' , value ] ].
	^ value asNumber
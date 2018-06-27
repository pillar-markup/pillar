instance creation
keyNode: aParameterKey valueNode: aParameterValue 
	| anInstance |
	anInstance := self new.
	anInstance add: aParameterKey.
	anInstance add: aParameterValue.
	^ anInstance 
instance creation
withStatus: aBoolean


	^ aBoolean 
		ifTrue: [ PRSuccess new ]
		ifFalse: [ PRFailure new ]
private
parseKeyValueArgument: argument

	| key value argumentStream |
	argumentStream := argument readStream.
	(argumentStream next: '--' size) ~= '--'
		ifTrue: [ Error signal: 'Invalid parameter ', argument ].
	key := argumentStream upTo: $=.
	value := argumentStream upToEnd.
	^ key -> value
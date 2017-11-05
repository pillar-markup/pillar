private
add: argument to: arguments
	"From the argument string '--key=value', add the key/value pair to the arguments dictionary."
	| key value argumentStream |
	argumentStream := argument readStream.
	(argumentStream next: '--' size) ~= '--'
		ifTrue: [ Error signal: 'Invalid parameter ', argument ].
	key := argumentStream upTo: $=.
	value := argumentStream upToEnd.
	^ arguments at: key put: value
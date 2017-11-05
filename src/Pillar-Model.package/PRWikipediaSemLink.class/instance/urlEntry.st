accessing-dynamic
urlEntry

	| ref |
	ref := (self reference splitOn: ':') second.
	^ ref = '' ifTrue: [ '' ] ifFalse: [ 'wiki/' , ref ]
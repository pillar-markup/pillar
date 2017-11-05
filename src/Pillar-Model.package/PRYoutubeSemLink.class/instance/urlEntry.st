accessing-dynamic
urlEntry
	
	| ref |
	ref := (self reference splitOn: ':') second.
	^ ref = '' ifTrue: [ '' ] ifFalse: [ 'watch?v=', ref ]
building suites
permutationsOf: aCollection 
	
	| restOfPermutations |
	aCollection ifEmpty: [ ^ #(#()) ].
	restOfPermutations := self permutationsOf: aCollection allButFirst.
	^ aCollection first flatCollect: [ :element | 
		restOfPermutations collect: [ :permutation | permutation copyWithFirst: element  ] ]
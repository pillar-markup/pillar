visiting-document
nest: aString do: aBlock
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
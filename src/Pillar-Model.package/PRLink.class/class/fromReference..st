instance creation
fromReference: aReference
	| classes  |
	classes := PRLink withAllConcreteClasses select: [ :each | each isValidReference: aReference ].
	classes sort: [ :a :b | a priority < b priority ].
	^ classes first reference: aReference
archetypes
archetypeNamed: aString 
	
	^ PRArchetype new
		name: aString;
		project: self;
		yourself
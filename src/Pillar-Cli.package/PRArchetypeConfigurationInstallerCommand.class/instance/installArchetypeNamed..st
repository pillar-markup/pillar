actions
installArchetypeNamed: archetypeName

	| archetypeReference |
	archetypeReference := FileLocator imageDirectory / 'archetypes' / archetypeName.
	archetypeReference exists ifFalse: [
		self error: 'Archetype ', archetypeName, ' does not exist'
	].
	archetypeReference copyAllTo: workingDirectory
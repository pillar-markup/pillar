actions
archetype: archetypeName
	
	| archetypeReference |	
	archetypeReference := FileLocator imageDirectory / 'archetypes' / archetypeName.
	archetypeReference exists ifFalse: [
		self error: 'Archetype ', archetypeName, ' does not exist'
	].
	
	PRFileCopyVisitor
		copy: archetypeReference resolve asAbsolute
		to: self baseDirectory
		onConflictDo: [ :source :target | 
			(target isFile and: [ target extension ~= 'pillar' ])
				ifTrue: [ 
					target ensureDelete.
					source copyTo: target ].
			target isDirectory ifTrue: [ target ensureCreateDirectory ] ]
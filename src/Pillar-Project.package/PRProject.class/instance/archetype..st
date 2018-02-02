actions
archetype: archetypeName
	
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	archetype installIn: self baseDirectory
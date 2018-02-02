templates
installTemplate: archetypeName 
	
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	archetype installTemplateIn: self baseDirectory
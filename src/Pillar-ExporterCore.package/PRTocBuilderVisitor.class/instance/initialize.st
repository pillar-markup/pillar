initialization
initialize
	super initialize.
	toc := PRToc new level: 0.
	tocsStack := Stack new.
	tocsStack push: toc
initialization
initialize
	super initialize.
	transformations := Set new.
	self buildAll.
	status := PRSuccess new.
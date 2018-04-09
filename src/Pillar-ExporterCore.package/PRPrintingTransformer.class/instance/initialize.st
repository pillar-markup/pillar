initialization
initialize
	super initialize.
	self flag: 'Why printer is not accessed via the configuration'.
	printer := PRTitlePrinter new
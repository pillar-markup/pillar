initialization
initialize
	super initialize.
	headerCounter := PRCascadingCounter maxLevel: 5.
	figureCounter := PRCascadingCounter maxLevel: 2.
	scriptCounter := PRCascadingCounter maxLevel: 2.
	anchorsMapping := Dictionary new
visiting
addToToc: aTocTitle
	self top level < aTocTitle level
		ifTrue: [ self top addChildren: aTocTitle.
			self push: aTocTitle ]
		ifFalse: [ self pop.
			self addToToc: aTocTitle ]
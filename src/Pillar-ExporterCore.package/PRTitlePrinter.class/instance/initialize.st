initialization
initialize

	super initialize.
	levels := Array new: self maxLevels.
	1 to: self maxLevels do: [ :l | 
		levels at: l put:  (PRLevelNumberPrinter new
								size: l;
								level: l;
								printer: self;
								yourself) ]
initialization
initialize

	super initialize.
	levels := Array new: self maxLevels.
	1 to: self maxLevels do: [ :l | 
		levels at: l put:  (PRLevelNumberPrinter new
								headerSize: l;
								level: l;
								printer: self;
								yourself) ]
accessing
printerSpecFor: aStyle 

	^ (self strategyClassMapping at: aStyle) new
	
	
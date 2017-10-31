action
incrementAt: level 
	counters at: level put: (counters at: level) + 1.
	level + 1 to: counters size
		do: [ :i | counters at: i put: 0 ]
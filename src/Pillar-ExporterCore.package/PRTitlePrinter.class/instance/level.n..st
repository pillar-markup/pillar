accessing
level: aLevelSpec n: n

	levels at: (self levelIndex: n) put: aLevelSpec.
	aLevelSpec level: n.
	aLevelSpec printer: self.
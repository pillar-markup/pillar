running
tearDown
	
	| pak |
	super tearDown.
	pak := RPackageOrganizer default packageNamed: #'Pillar-BookTesterResults-TestResults' ifAbsent: [^ self ].
	pak removeFromSystem.


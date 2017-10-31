tests
testAnyCycleDependencies
	| packages cycleDetector |
	packages := RPackageOrganizer default packages
		select: [ :p | p name beginsWith: 'Pillar' ].
	cycleDetector := (DAPackageCycleDetector
		onPackagesNamed: (packages collect: [ :each | each packageName ])) runAlgorithm.
	self assert: cycleDetector cycles size equals: 0
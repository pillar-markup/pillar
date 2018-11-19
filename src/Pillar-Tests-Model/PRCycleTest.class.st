Class {
	#name : #PRCycleTest,
	#superclass : #TestCase,
	#instVars : [
		'instance'
	],
	#category : 'Pillar-Tests-Model-Core'
}

{ #category : #tests }
PRCycleTest >> testAnyCycleDependencies [

	| packages cycleDetector |
	self skip: 'to be checked after removal of magritte'.
	packages := RPackageOrganizer default packages
		select: [ :p | p name beginsWith: 'Pillar' ].
	cycleDetector := (DAPackageCycleDetector
		onPackagesNamed: (packages collect: [ :each | each packageName ])) runAlgorithm.
	self assert: cycleDetector cycles size equals: 0
]

comparing
allDependencies

	^ self dependencies, (self dependencies flatCollect: [ :each | each allDependencies ])
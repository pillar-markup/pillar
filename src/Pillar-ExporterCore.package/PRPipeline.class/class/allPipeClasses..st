building
allPipeClasses: aConfiguration
	"Returns all the classes that can be used in a given pipeline as defined by its key"
	
	^ self allConcretePipeClasses
		select:
			[ :each | each pipelineKey = self key and: [ each isEnabled: aConfiguration ] ]
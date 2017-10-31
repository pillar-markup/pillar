private
allConcretePipeClasses 
	^ PRTPipe users asArray flatCollect: [ :klass | klass withAllConcreteClasses ]
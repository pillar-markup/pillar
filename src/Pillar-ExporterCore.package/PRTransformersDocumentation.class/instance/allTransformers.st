accessing
allTransformers
	
	^ PRTPipe users asArray
		flatCollect: [ :klass | 
			klass withAllConcreteClasses select: [ :e |
				e key = #transform ] ]
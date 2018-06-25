accessing
script
	^ super script ==> [ :aNode | 
			self commands add: (GTPillarCodeHighlightingCommand new
				start: aNode start;
				stop: aNode stop; 
				properties: aNode parameters;
				string: aNode text) ]
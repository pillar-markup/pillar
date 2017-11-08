accessing
buildStrategy
	
	| strategyClass |
	strategyClass := self configuration propertyAt: #buildStrategy ifAbsent: [ PRBuildAllStrategy ].
	^ strategyClass on: self
accessing
strategyClassMapping
	^ StrategyMapping ifNil: [ StrategyMapping := self defaultStrategyMapping ]